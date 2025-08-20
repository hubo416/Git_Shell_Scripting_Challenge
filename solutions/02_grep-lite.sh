#!/bin/bash

 # Mission: 02_grep-lite.sh
 # 파일 또는 표준 입력(stdin)에서 특정 패턴의 문자열을 검색하는 grep 명령어의 경량 버전을 구현합니다.

# 요구사항:
# -i: 대소문자를 무시하고 검색합니다.
# -n: 검색된 라인의 번호를 함께 출력합니다.


#  !! 참가자 솔루션 !!
# 아래에 다른 참가자의 코드를 지우지 말고, 자신의 코드를 추가하세요.
# 충돌 발생 시, 다른 사람의 코드는 남겨두고 본인의 코드를 그 아래에 병합해야 합니다.

# --- 참가자: [Your Name Here] ---
# (여기에 자신의 스크립트 코드를 작성하세요)
# wc_lite_solution_yourname() {
#    Your logic here
#    echo "My solution for grep-lite"
# }
grep_lite_solution_mj() {
    # 옵션을 담을 배열 초기화
    local grep_options=()

    # getopts를 사용하여 -i, -n 옵션 처리
    while getopts "in" opt; do
        case $opt in
            i)
                # -i 옵션이 있으면 grep_options 배열에 "-i" 추가
                grep_options+=("-i")
                ;;
            n)
                # -n 옵션이 있으면 grep_options 배열에 "-n" 추가
                grep_options+=("-n")
                ;;
            \?)
                echo "잘못된 옵션입니다: -$OPTARG" >&2
                return 1
                ;;
        esac
    done

    # 옵션 인자들을 처리한 후, 다음 인자로 이동
    shift $((OPTIND - 1))

    # 패턴과 파일명이 제대로 주어졌는지 확인
    if [ "$#" -lt 1 ]; then
        echo "사용법: $0 [-i] [-n] <패턴> [파일명]" >&2
        return 1
    fi

    local pattern=$1
    local file=$2

    # 파일명이 없는 경우, 표준 입력(stdin)에서 검색
    if [ -z "$file" ]; then
        grep "${grep_options[@]}" -- "$pattern"
    # 파일이 존재하고 읽기 가능한 경우, 파일에서 검색
    elif [ -r "$file" ]; then
        grep "${grep_options[@]}" -- "$pattern" "$file"
    # 파일이 없거나 읽을 수 없는 경우, 에러 출력
    else
        echo "오류: 파일을 읽을 수 없습니다: $file" >&2
        return 1
    fi
}
#grep_lite_solution_mj "$@"

rep_lite_solution_Famas() {
    echo "Sarah's solution for grep-lite"
    local case_insensitive=false
    local show_lines=false
    local invert_match=false

    while [[ "$1" == -* ]]; do
        case "$1" in
            -i) case_insensitive=true; shift ;;
            -n) show_lines=true; shift ;;
            -v) invert_match=true; shift ;;
            *) echo "Error: Invalid option '$1'" >&2; return 1 ;;
        esac
    done

    if [ "$#" -lt 2 ]; then
        echo "Usage: $0 [-i] [-n] [-v] PATTERN FILE" >&2
        return 1
    fi

    local pattern="$1"
    local file="$2"

    if [ ! -f "$file" ]; then
        echo "Error: File not found: '$file'" >&2
        return 1
    fi
    
    $case_insensitive && shopt -s nocasematch

    local line_num=0
    while IFS= read -r line; do
        ((line_num++))

        local match=false
        # Bash 패턴 매칭으로 일치 여부 확인
        if [[ "$line" == *"$pattern"* ]]; then
            match=true
        fi

        # XOR 로직: match 상태와 invert 옵션이 다를 때만 출력
        if [ "$match" != "$invert_match" ]; then
            if $show_lines; then
                echo "$line_num:$line"
            else
                echo "$line"
            fi
        fi
    done < "$file"

    $case_insensitive && shopt -u nocasematch
}

rep_lite_solution_Famas "$@"
