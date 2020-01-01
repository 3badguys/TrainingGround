#!/usr/bin/python

import xlrd
import xlwt
from xlutils.copy import copy
from xlutils.styles import Styles

def format_excel(src_path, dst_path):
    if not src_path or not dst_path:
        return None

    excel_data = xlrd.open_workbook(src_path)
    new_excel_data = copy(excel_data)
    newWs = new_excel_data.get_sheet(0)

    pattern = xlwt.Pattern()  # Create the Pattern
    pattern.pattern = xlwt.Pattern.SOLID_PATTERN  # May be: NO_PATTERN, SOLID_PATTERN, or 0x00 through 0x12
    pattern.pattern_fore_colour = 2  # May be: 8 through 63. 0 = Black, 1 = White, 2 = Red, 3 = Green, 4 = Blue, 5 = Yellow, 6 = Magenta, 7 = Cyan, 16 = Maroon, 17 = Dark Green, 18 = Dark Blue, 19 = Dark Yellow , almost brown), 20 = Dark Magenta, 21 = Teal, 22 = Light Gray, 23 = Dark Gray, the list goes on...
    style = xlwt.XFStyle()  # Create the Pattern
    style.pattern = pattern  # Add Pattern to Style

    # only one table in the excel file
    table_data = excel_data.sheet_by_name("data")

    nrows = table_data.nrows
    ncols = table_data.ncols
    print "row = %d, col = %d" % (nrows, ncols)

    materiel_list = table_data.col_values(2)
    date_list = table_data.col_values(3)
    supplier_list = table_data.col_values(4)
    supid_list = table_data.col_values(5)

    data_dict = {}
    for i in range(1, nrows):
        # key = materiel + supplier
        key = str(materiel_list[i]) + "@" + supplier_list[i]
        if key not in data_dict:
            data_dict[key] = []
        data = [date_list[i], supid_list[i], i]
        data_dict[key].append(data)

    # print data_dict
        
    for key, value in data_dict.items():
        pre_date = value[0][0]
        cur_max_supid = 0
        pre_max_supid = 0
        for entry in value:
            entry_date = entry[0]
            entry_supid = entry[1]
            row_id = entry[2]
            if entry_date != pre_date:
                pre_max_supid = cur_max_supid
                if entry_supid >= pre_max_supid:
                    if entry_supid >= cur_max_supid:
                        cur_max_supid = entry_supid
                else:
                    newWs.write(row_id, 3, entry_date, style)
                    print "ERROR1: %d ==> %s" % (row_id, entry)
            else:
                if entry_supid >= pre_max_supid:
                    if entry_supid >= cur_max_supid:
                        cur_max_supid = entry_supid
                else:
                    newWs.write(row_id, 3, entry_date, style)
                    print "ERROR2: %d ==> %s" % (row_id, entry)
            pre_date = entry_date

    new_excel_data.save(dst_path)

def main():
    src_path = "./new_data.xls"
    dst_path = "./final_data.xls"
    format_excel(src_path, dst_path)

if __name__ == "__main__":
    main()
