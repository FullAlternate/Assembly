# Copyright
# Laget av Jesper, kongen over alle sørlandsmenn (og Johan)


def data_generator(file, start_num, end_num, mode=None):

    the_file = open(file, "w")
    i = start_num

    if mode == "even":  # BOOM!
        total_low = start_num - 1
        total = int((end_num - total_low) / 2)
        data_string = str(total)+"\n"

        if start_num % 2 != 0:
            i += 1

        while i <= end_num:
            data_string += str(i)+"\n"
            i += 2

    elif mode == "odd":  # ODD OGSÅ, HER KJØRER VI PÅ!
        total_low = start_num - 1
        total = int((end_num - total_low) / 2)
        data_string = str(total) + "\n"

        if start_num % 2 == 0:
            i += 1

        while i <= end_num:
            data_string += str(i)+"\n"
            i += 2

    else:  # DEN KJEDELIGE NORMALE TIL SIST! LET'S GO!!!
        total_low = start_num - 1
        total = (end_num - total_low)
        data_string = str(total) + "\n"

        while i <= end_num:
            data_string += str(i)+"\n"
            i += 1

    the_file.write(data_string)  # NÅ STAPPER VI ALT I FILEN
    the_file.close()


# Her kan du lage dine helt egne datasett, hvor kult er ikke det!
data_generator("odd_dataset.txt", 1, 1000, "odd")