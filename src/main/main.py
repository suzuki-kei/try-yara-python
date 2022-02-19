import glob
import yara


def main():
    rules = load_rules()
    sample_files = find_sample_files()
    identify_files(rules, sample_files)


def load_rules() -> yara.Rules:
    file_paths = sorted(glob.glob("src/rules/*.yar"))
    rule_texts = map(load_text_file, file_paths)
    joined_rule_text = "\n".join(rule_texts)
    return yara.compile(source=joined_rule_text)


def find_sample_files() -> list[str]:
    return sorted(glob.glob("malware-samples/*"))


def identify_files(rules: yara.Rules, file_paths: list[str]) -> None:
    for file_path in file_paths:
        data = load_binary_file(file_path)
        matches = rules.match(data=data)
        print(file_path, matches)


def load_text_file(file_path: str) -> str:
    with open(file_path, "r") as file:
        return file.read()


def load_binary_file(file_path: str) -> bytes:
    with open(file_path, "rb") as file:
        return file.read()


main()

