#!/usr/bin/python
# -*- coding: utf-8 -*-

def simulate_func(pop_seq, current_index, push_seq, stack_seq):
    if current_index == len(push_seq):
        print pop_seq + stack_seq[::-1]
        return 0

    # 出栈
    if len(stack_seq) > 0:
        tmp_pop_seq = pop_seq[:]
        tmp_pop_seq += stack_seq[-1]
        tmp_stack_seq = stack_seq[:-1]
        simulate_func(tmp_pop_seq, current_index, push_seq, tmp_stack_seq)

    # 入栈
    tmp_stack_seq = stack_seq[:]
    tmp_stack_seq += push_seq[current_index]
    simulate_func(pop_seq, current_index+1, push_seq, tmp_stack_seq)

    return 0

def main():
    push_seq = raw_input()
    simulate_func("", 0, push_seq, "")

if __name__ == "__main__":
    main()
