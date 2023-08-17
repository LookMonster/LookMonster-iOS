#!/bin/bash

# monster.sh

if [ "$1" = "generate" ]; then
    echo "프로젝트를 준비 중입니다. (옷 갈아 입는 중...)"
    tuist fetch
    tuist generate
    echo "프로젝트 실행 준비가 완료되었습니다...!(가는 중...)"
elif [ "$1" = "clean" ]; then
    echo "프로젝트를 초기화중 (옷 세탁소에 맡기는 중...)"
    tuist clean
    echo "프로젝트 초기화가 완료되었습니다...!(옷이 세탁되었습니다...)"
else
    echo "사용법: ./monster.sh generate 또는 ./monster.sh clean"
fi
