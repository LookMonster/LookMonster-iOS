#!/bin/bash

# monster.sh

if [ "$1" = "generate" ]; then
    echo "프로젝트를 준비 중입니다. (옷 갈아 입는 중...🎱)"
    tuist fetch
    if tuist generate; then
        echo "프로젝트 실행 준비가 완료되었습니다...!(준비 완료...😁)"
    else
        echo "프로젝트 실행 준비에 실패하였습니다...!(준비 실패...🙁)"
        echo "⚠️ ↑↑↑↑↑ 위 에러를 고려해주세요 ↑↑↑↑↑ ⚠️"
    fi
elif [ "$1" = "clean" ]; then
    echo "프로젝트를 초기화중 (옷 세탁소에 맡기는 중...🧺)"
    tuist clean
    rm -rf **/*.xcodeproj
    rm -rf *.xcworkspace
    echo "프로젝트 초기화가 완료되었습니다...!(옷이 세탁되었습니다...🥼)"
    
elif ["$1" = "edit"]; then
    echo "프로젝트 수정 준비 중입니다. (옷장 속에서 옷을 골라 입을 준비를 하고 있습니다...)"
    tuist edit
    echo "프로젝트 수정 준비가 완료되었습니다! (옷장 속에서 옷을 골라 입을 준비를 완료했습니다...)"
else
    echo "사용법: ./monster.sh generate 또는 ./monster.sh clean"
fi
