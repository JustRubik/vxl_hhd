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

```C++
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
- 

