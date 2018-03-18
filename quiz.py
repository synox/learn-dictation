#!/usr/bin/env python3
import sys
from subprocess import call


def check(answer):
    correct = answer == sys.stdin.readline()
    print('✓' if correct else '❌')
    return correct


with open(sys.argv[1]) as myfile:
    for line in myfile:
        question, answer = line.partition("=")[::2]
        if not answer: answer = question

        call(["say", "--voice=Yuri", question])
        if check(answer): continue

        call(["say", "--voice=Milena", question])
        if check(answer): continue

        print(" = ", answer, "(press enter to continue)")
