#!/usr/bin/python
# -*- coding: utf-8 -*-

total_count = 0

def search_func(target_hight, current_hight, x_y_z):
    global total_count
    
    for edge_len in x_y_z:
        if current_hight + edge_len == target_hight:
            total_count += 1
        elif current_hight + edge_len < target_hight:
            search_func(target_hight, current_hight + edge_len, x_y_z)

def main():
    global total_count
    
    N = input()

    x_y_z_str = raw_input()
    x_y_z = [ int(i) for i in x_y_z_str.split() ]
    search_func(N, 0, x_y_z)

    print total_count

if __name__ == "__main__":
    main()
