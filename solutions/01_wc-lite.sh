#======
#!/bin/bash 
# Mission: 01_wc-lite
#=======
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


#=======
# wc_lite_solution_yourname() {
#    Your logic here
#    echo "My solution for wc-lite"
# }


 ############################################
 ############################################
 ################## 방어막 ##################
 ############################################
 ############################################
 wc_lite_solution_yschoi() {
    local opt_l=false
    local opt_w=false
    local opt_c=false
    local file=""

    # 옵션 파싱
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -l) opt_l=true; shift ;;
            -w) opt_w=true; shift ;;
            -c) opt_c=true; shift ;;
            *)  file="$1"; shift ;;
        esac
    done

    # 파일 또는 stdin 읽기
    if [[ -n "$file" ]]; then
        input=$(cat "$file")
    else
        input=$(cat)
    fi

    # 기본 옵션 (아무것도 없을 때 전부 출력)
    if ! $opt_l && ! $opt_w && ! $opt_c; then
        opt_l=true; opt_w=true; opt_c=true
    fi

    # 카운트 계산
    line_count=$(echo "$input" | wc -l)
    word_count=$(echo "$input" | wc -w)
    char_count=$(echo "$input" | wc -m)

    # 출력
    $opt_l && echo "Lines: $line_count"
    $opt_w && echo "Words: $word_count"
    $opt_c && echo "Chars: $char_count"
}
 ############################################
 ############################################
 ################## 방어막 ##################
 ############################################
 ############################################
