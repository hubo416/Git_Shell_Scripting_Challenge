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

#!/bin/bash

wc_lite_solution_sarah() {
    show_lines=0
    show_words=0
    show_chars=0
    files=()

    # 옵션 처리
    while [[ $# -gt 0 ]]; do
        case $1 in
            -l) show_lines=1 ;;
            -w) show_words=1 ;;
            -c) show_chars=1 ;;
            --) shift; while [[ $# -gt 0 ]]; do files+=("$1"); shift; done; break ;;
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

        [[ $show_lines -eq 1 ]] && echo -n "Lines: $(wc -l < "$f") "
        [[ $show_words -eq 1 ]] && echo -n "Words: $(wc -w < "$f") "
        [[ $show_chars -eq 1 ]] && echo -n "Chars: $(wc -c < "$f") "
        echo
    done
}

# 호출
wc_lite_solution_sarah "$@"
