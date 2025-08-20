<<<<<<< Updated upstream
#!/bin/bash

 # Mission: 01_wc-lite
 # 텍스트 파일의 라인 수, 단어 수, 문자 수를 세는 `wc` 명령어의 경량 버전을 구현합니다.

 # 요구사항:
 #  - -l: 라인 수 출력
 #  - -w: 단어 수 출력
 #  - -c: 문자 수 출력
 #  - 옵션이 없으면 -l, -w, -c 결과를 모두 출력합니다.


#  !! 참가자 솔루션 !!
# 아래에 다른 참가자의 코드를 지우지 말고, 자신의 코드를 추가하세요.
# 충돌 발생 시, 다른 사람의 코드는 남겨두고 본인의 코드를 그 아래에 병합해야 합니다.

# --- 참가자: [Your Name Here] ---
# (여기에 자신의 스크립트 코드를 작성하세요)
 wc_lite_solution_yourname() {
    echo "Sarah's solution for wc-lite"
 }
=======
#!/bin/bash 
# Mission: 01_wc-lite
 # 텍스트 파일의 라인 수, 단어 수, 문자 수를 세는 `wc` 명령어의 경량 버전을 구현합니다.

 # 요구사항:
 #  - -l: 라인 수 출력
 #  - -w: 단어 수 출력
 #  - -c: 문자 수 출력
 #  - 옵션이 없으면 -l, -w, -c 결과를 모두 출력합니다.


#  !! 참가자 솔루션 !!
# 아래에 다른 참가자의 코드를 지우지 말고, 자신의 코드를 추가하세요.
# 충돌 발생 시, 다른 사람의 코드는 남겨두고 본인의 코드를 그 아래에 병합해야 합니다.

# --- 참가자: [Your Name Here] ---
# (여기에 자신의 스크립트 코드를 작성하세요)
wc_lite_solution_sarah() {
    echo "Sarah's solution for wc-lite"
    # 인자가 하나도 없으면 사용법 출력 후 종료
    if [ $# -eq 0 ]; then
        echo "Usage: $0 [-l] [-w] [-c] file" >&2
        return 1
    fi

    # 마지막 인자를 파일명으로 간주
    local filename="${@:-1}"
    # 마지막 인자를 제외한 나머지 인자들을 옵션으로 간주
    local options=("${@:1:$#-1}")

    # 파일이 존재하지 않으면 에러 출력 후 종료
    if [ ! -f "$filename" ]; then
        echo "Error: File not found: '$filename'" >&2
        return 1
    fi

    # 사용자가 옵션을 제공했는지 확인
    if [ ${#options[@]} -eq 0 ]; then
        # 옵션이 없으면 기본값(-l, -w, -c)으로 wc 실행
        wc -l -w -c "$filename"
    else
        # 옵션이 있으면 해당 옵션을 그대로 wc에 전달
        wc "${options[@]}" "$filename"
    fi
}

# 스크립트의 인자를 함수로 전달하여 실행
wc_lite_solution_sarah "$@"


>>>>>>> Stashed changes
