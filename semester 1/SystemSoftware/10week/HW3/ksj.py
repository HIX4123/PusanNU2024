def process_macros(code):
    macro_definitions = {}
    processed_code = []

    i = 0
    while i < len(code):
        line = code[i].strip()

        # 매크로 정의 찾기
        if line.startswith("%macro"):
            macro_name = line.split()[1]
            macro_body = []

            i += 1
            while not code[i].strip().startswith("%endmacro"):
                macro_body.append(code[i].strip())
                i += 1

            macro_definitions[macro_name] = macro_body

        # 매크로 호출 찾기
        elif any(line.startswith(macro_name) for macro_name in macro_definitions):
            macro_name = line.split()[0]
            macro_args = line.split()[1:]

            if macro_name in macro_definitions:
                macro_body = macro_definitions[macro_name]
                for macro_line in macro_body:
                    for j, arg in enumerate(macro_args):
                        macro_line = macro_line.replace(f"%{j+1}", arg)
                    processed_code.append(macro_line)

        # 일반 코드
        else:
            processed_code.append(line)

        i += 1

    return processed_code

def main():
    input_file = "w.asm"
    output_file = "w.tmp"

    # 파일에서 어셈블리 코드 읽기
    with open(input_file, "r") as f:
        assembly_code = f.readlines()

    # 매크로 제거 및 대체 후 결과 저장
    processed_code = process_macros(assembly_code)
    with open(output_file, "w") as f:
        f.write("\n".join(processed_code))

if __name__ == "__main__":
    main()

