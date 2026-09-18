# README

## Đây là gì???

Repository này là 1 repository (dài dòng quá, gọi là repo nhé) để lưu lại bài tập môn Kĩ thuật Vi xử lí của thầy Hàn Huy Dũng.

Repo này ra đời để quản lý bài tập dễ dàng hơn thôi, không có gì nhiều cả.

Nếu thầy đọc được những dòng này, thì em mong thầy nhẹ nhàng với em một chút, hehe.

Các bạn sinh viên có thể clone repo của mình để tham khảo, hoặc là để chửi mình cũng được, hoan nghênh blame, hehe.

Trong tài liệu này, em xin phép thầy được xưng "mình".

## Workflow???

- OS: Debian 13 (Trixie)
- DE: KDE plasma
- Editor: Neovim 0.11.7 (LazyVim)
- Terminal: Alaccritty (my favorite one)
- Shell: Zsh

## Cấu trúc repo

Cấu trúc repo rất đơn giản, bao gồm các thư mục ghi tên bài, ví dụ như bai_1, và mỗi bài là 1 project độc lập.

Giả dụ như sau:

```Tree
.
├── Bai_1
|   └─Subfolders/
|       └─Files
|   
└── README.md

```

## Một vài thứ khác

### crg

Trong mã nguồn, nhất là phần báo cáo về c/c++, có thể có bạn sẽ thắc mắc 1 vài command của mình, ví dụ như:

`crg hello.c 11`

Vậy **crg** là gì?

**crg** là shell script, tên đầy đủ là Compile & Run with GCC (hoặc G++). Đúng như cái tên, nó dùng để compile và run 1 chương trình c/c++, tùy vào loại file được truyền vào.

script đầy đủ như sau:

```Zsh
crg () {
  if [ -z "$1" ]; then
    echo "[ERROR]: No files found"
    return 1
  fi

  ext="${1##*.}"
  ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')

  filename="${1%.*}"
  version="${2:-11}"

  if [ "$ext" = "cpp" ]; then
    ggg="g++"
    std="c++"
  elif [ "$ext" = "c" ]; then
    ggg="gcc"
    std="c"
  else
    echo "[ERROR]: False extension"
    return 1
  fi
  
  "$ggg" -std="$std$version" -O3 -Wall "$1" -o "$filename" && "./$filename"
}
```

*Mình đang sử dụng gcc (Debian 14.2.0-19) 14.2.0 và g++ (Debian 14.2.0-19) 14.2.0.*

Cách sử dụng cũng đơn giản thôi, cứ `crg arg1 arg2` thôi, với `arg1` là tên file và `arg2` là số phiên bản, mặc định là 11.

### markdown file

Mình biết là nhiều người không biết định dạng markdown này đâu, nhưng mình hiện tại hay sử dụng nó để viết tài liệu cho các repo khác, và nó thật sự tốt ấy.

Để xem trên máy tính cá nhân của bạn thì mình nghĩ là chỉ có cách xem trên github là đơn giản và hiệu quả nhất thôi.

### AI agent

Thường mình không sử dụng đâu, hoặc nếu có dùng sẽ là bản free của chatGPT.
