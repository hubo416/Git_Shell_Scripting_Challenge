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
#wc_lite_solution_sarah "$@"


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

}


# wc_lite_solution_Famas(){
#    echo "Famas 코드";
# }
    # 출력
   # $opt_l && echo "Lines: $line_count"
   # $opt_w && echo "Words: $word_count"
   # $opt_c && echo "Chars: $char_count"
 ############################################
 ############################################
 ################## 방어막 ##################
 ############################################
 ############################################

wc_lite_solution_mj() {
    # 옵션 플래그 초기화
    show_lines=0
    show_words=0
    show_chars=0
    option_count=0

    # getopts를 사용하여 -l, -w, -c 옵션 처리
    while getopts "lwc" opt; do
        case $opt in
            l)
                show_lines=1
                ((option_count++))
                ;;
            w)
                show_words=1
                ((option_count++))
                ;;
            c)
                show_chars=1
                ((option_count++))
                ;;
            \?)
                echo "잘못된 옵션입니다: -$OPTARG" >&2
                return 1
                ;;
        esac
    done

    # 옵션 인자들을 처리한 후, 다음 인자로 이동
    shift $((OPTIND - 1))
    
    # 파일명이 없으면 표준 입력(stdin)을 사용
    file=${1:-/dev/stdin}
    
    if [[ "$file" != "/dev/stdin" && ! -r "$file" ]]; then
        echo "오류: 파일을 읽을 수 없습니다: $file" >&2
        return 1
    fi
    
    # 파일 내용을 변수에 저장 (표준 입력 포함)
    content=$(cat -- "$file")

    # 옵션이 하나도 주어지지 않은 경우, 모든 옵션을 활성화
    if [ $option_count -eq 0 ]; then
        show_lines=1
        show_words=1
        show_chars=1
    fi
    
    # 결과 문자열을 담을 변수
    output=""

    # 각 옵션에 따라 결과 계산 및 output 변수에 추가
    if [ $show_lines -eq 1 ]; then
        lines=$(echo -n "$content" | wc -l)
        output="${output} ${lines}"
    fi

    if [ $show_words -eq 1 ]; then
        words=$(echo -n "$content" | wc -w)
        output="${output} ${words}"
    fi

    if [ $show_chars -eq 1 ]; then
        # wc -c는 바이트 수를 계산합니다.
        chars=$(echo -n "$content" | wc -c)
        output="${output} ${chars}"
    fi

    # 앞뒤 공백을 제거하고 결과 출력
    # 파일명이 인자로 주어진 경우, 파일명도 함께 출력
    if [ -n "$1" ]; then
        echo "${output} $1" | sed 's/^ *//'
    else
        echo "${output}" | sed 's/^ *//'
    fi
}

# mj 실행하기
# wc_lite_solution_mj "$@"

#!/bin/bash

# --- 참가자: Famas ---
wc_lite_solution_Famas() {
    # 인자 처리
    local lines=0
    local words=0
    local chars=0
    local show_lines=0
    local show_words=0
    local show_chars=0
    local files=()

    # 옵션 확인
    while [[ $# -gt 0 ]]; do
        case $1 in
            -l) show_lines=1 ;;
            -w) show_words=1 ;;
            -c) show_chars=1 ;;
            --) shift; files+=("$1") ;;
            -*) echo "Unknown option: $1"; return 1 ;;
            *) files+=("$1") ;;
        esac
        shift
    done

    # 옵션이 하나도 없으면 모두 출력
    if [[ $show_lines -eq 0 && $show_words -eq 0 && $show_chars -eq 0 ]]; then
        show_lines=1
        show_words=1
        show_chars=1
    fi

    # 파일 처리
    for f in "${files[@]}"; do
        if [[ ! -f $f ]]; then
            echo "File not found: $f"
            continue
        fi

        [[ $show_lines -eq 1 ]] && echo -n "라인: $(wc -l < "$f") "
        [[ $show_words -eq 1 ]] && echo -n "단어: $(wc -w < "$f") "
        [[ $show_chars -eq 1 ]] && echo -n "글자: $(wc -c < "$f") "
        echo
    done
}
wc_lite_solution_Famas "$@"
