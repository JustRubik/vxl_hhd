# Báo cáo bài tập

## Đề bài

- Viết chương trình đơn giản: in ra 1 dòng "hello world" bằng 3 ngôn ngữ: Python,  C , Assembly. 
- Dịch ra 3 file exe chạy độc lập. So sánh kích thước 3 file.
- Chạy 3 chương trình trên máy tính của mình. So sánh thời gian chạy.
- Viết báo cáo toàn bộ quá trình.

## Báo cáo kết quả đạt được

### 1. Viết chương trình "Hello world"

#### Python

Trong Python, để viết ra chương trình "Hello world", thì đơn giản chỉ cần 1 dòng duy nhất:

`print("Hello world")`

Lưu file main.py, và sau đó chạy lệnh:

`python3 main.py`

*Câu lệnh được chạy trên OS Debian 13, cú pháp trên Windows đơn giản là `python main.py`*
*Lưu ý: cần chuyển về folder python/ trước khi chạy `cd python`*

Kết quả:

`Hello World`

#### C/C++

- Với C, chương trình như sau:

```C
#include <stdio.h>

int main () {
  printf("Hello world");
}
```

Chương trình lưu trong `helloc.c`

Chạy chương trình:

`crg helloc.c`

Kết quả:

`Hello world%`

- Với C++, chương trình như sau:

```C
#include <iostream>

int main() {
  std::cout << "Hello world" << std::endl;
}
```

Chương trình lưu trong file `hellocpp.cpp`

Chạy chương trình:

`crg hellocpp.cpp`

Kết quả:

`Hello world`

#### Assembly

Assembly là 1 ngôn ngữ khá mới đối với bản thân em, nên em đã tham khảo code trên trang web [TutorialsPoint](https://www.tutorialspoint.com/assembly_programming/index.htm)

Chương trình như sau:

```Asm
section .text:
  global _start

_start:
  mov edx, len
  mov ecx, msg
  mov ebx, 1
  mov eax, 4
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80

section .data
msg db 'Hello world', 0xa
len equ $ - msg
```

Chương trình được lưu trong file `hello.asm`

Các điều kiện để chương trình được biên dịch, liên kết và cuối cùng có thể "chạy" file thực thi:

- Đảm bảo câu lệnh sử dụng ở folder chứa `hello.asm`
- Máy tính đã cài đặt `nasm` (*chi tiết xem ở phụ lục*)
- Để "tập hợp" chương trình, sử dụng câu lệnh `nasm -f elf hello.asm`
- Sau bước trên, folder xuất hiện file `hello.o` (*nếu không thì có lỗi*)
- Để liên kết object file và tạo file thực thi, chạy lệnh `ld -m elf_i386 -s -o hello hello.o`
- Sau khi bước trên thành công, file `hello` sẽ được tạo, chạy bằng cách `./hello`

Một vài lưu ý:

- Hệ điều hành sử dụng là Debian 13, vậy nên file hello.asm sẽ rất khác với file này trên windows, và đồng thời các câu lệnh cũng rất khác, tham khảo phụ lục.
- Ta có thể thay thế tên file thực thi output bằng bất cứ cái tên nào, chả hạn `... -o hellodebian13 ...`

Chạy file `hello` bằng câu lệnh `./hello` trên terminal ở folder chứa file, kết quả thu được:

`Hello world`

### 2. Dịch ra 3 file thực thi độc lập, so sánh kích thước và tốc độ

Vì hệ điều hành em sử dụng là Debian 13, nên file thực thi là file elf (executable & linkable format).

Để lấy được kích thước file, em sử dụng câu lệnh: `du -csh $file`, trong đó -csh là flag gồm: -c: in thêm tổng, -s: in tổng của đối tượng chỉ định (không liệt kê đối tượng con), -h: hiển thị **"human-readable"**, và `$file` là file hoặc folder mà muốn kiểm tra kích thước.

Để so sánh tốc độ chạy file thực thi, em sử dụng thêm gói `hyperfine` có sẵn trên `apt`: `sudo apt install hyperfine`.

#### Python

Python là một ngôn ngữ lập trình thường được sử dụng như một ngôn ngữ scripting, tức là file .py chỉ cần chứa các dòng lệnh cơ bản và đôi khi là các hàm với chức năng phức tạp hơn, còn việc chạy hay thực thi file là do python runtime thực hiện.
Ở trên Debian 13, python3 được cài thông qua lệnh `sudo apt install python3`, là một interpreter, tức là nó chịu trách nhiệm thực thi các file `.py`.
Vì vậy, việc tạo file thực thi cho chương trình python là tương đối khó khăn, thứ nhất là phải có package phù hợp để đóng gói python runtime và tất cả dependencies cần thiết để tạo 1 file thực thi và thứ hai là kích thước của file đó cũng vì vậy mà lớn hơn file thực thi của C/C++ rất nhiều.

Trong báo cáo này, em sử dụng `pyinstaller`. Cách dùng:

`pyinstaller --one-file main.py`

Gói pyinstaller sẽ thực thi đóng gói python runtime để tạo thành 1 file thực thi `main` duy nhất (ở đường dẫn `"./python/dist/main"`)

Kích thước file:

`du -csh python/dist/main`

và kết quả:

`7.8M    python/dist/main
7.8M    total`

Tốc độ chạy file:

```Zsh
hyperfine -N -r 100 ./python/dist/main
```

và kết quả:

```Text
Benchmark 1: ./python/dist/main
    Time (mean )
```

#### C/C++

Với việc sử dụng câu lệnh tuỳ chỉnh `crg` (*xem thêm ở phụ lục*) trong ~/.zshrc, đầu ra của câu lệnh này đã là 1 file thực thi:

```Zsh
crg helloc

crg hellocpp
```

Kích thước file:

```Zsh
// Giả sử đang ở folder Bai_1 (folder gốc)
du -a c_cpp/

// Kết quả
4       ./helloc.c
16      ./helloc
4       ./hellocpp.cpp
20      ./hellocpp
```

#### Assembly

Kích thước file thực thi là kích thước file hello (elf):

```Zsh
// Giả sử đang ở folder Bai_1 (folder gốc)
cd asm/
du -a

// Kết quả

```


