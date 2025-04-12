# **SQL Training**
### Table of contents
1. [Báo cáo về bài tập SQL](#báo-cáo-về-bài-tập-sql-)
2. [Tìm hiểu về git-github](#tìm-hiểu-về-git-github-)

# Báo cáo về bài tập SQL 
### Testing System 1
Tìm hiểu cách tạo bảng cơ bản với các kiểu dữ liệu, định dạng có sẵn trong bài tập
### Testing System 2
- Tìm hiểu kĩ hơn về các datatype
- Tìm hiểu về các ràng buộc 
- Vẫn làm về tạo bảng như bài 1 nhưng update thêm các kiểu dữ liệu phù hợp hơn và các ràng buộc giữa các bảng

### Testing System 3
- Tìm hiểu các câu lệnh truy vấn
- Tìm hiểu về các thao tác thêm, xóa, sửa **(update, delete, insert)**

### Testing System 4
- Tìm hiểu về **Join** và các kiểu join trong SQL
- Làm quen **Union**

### Testing System 5
- Biết được cách **truy vấn lồng nhau**
- Hiểu về Bảng tạm **CTE**
- Tìm hiểu về **view** và cách khai báo

### Testing System 6
- Biết về **DELIMITER** để phân cách lại các câu lệnh trong procedure thành một câu lệnh duy nhất
- Tìm hiểu về **procedure**.

### Testing System 7
Tìm hiểu về **trigger** và **case when**

# Tìm hiểu về git-github
- Git là hệ thống quản lý tài liệu, source code. Giúp quản lý dự án của nhóm dễ hơn. Tất cả thao tác xóa, thêm, sửa, ... đều được git ghi lại. Từ đấy có thể giúp dễ dàng tìm ra nguyên nhân lỗi nếu dữ án đấy gặp phải.
- Có 2 loại repository là local repository và remote repository, github chính là remote repository.
- Để tạo repo trong một project thì đầu tiên vào folder đó rồi bật cmd lên. Sau đó nhập git init
- Tiếp theo đến git add, có thể git add . để thêm toàn bộ file có trong folder đó lên index.
- Sau đó cần phải commit để lưu lại các sự thay đổi ấy, lệnh là git commit -m "message"
- Tạo ra nhánh chính thì dùng câu lệnh git branch -M master, còn nếu không muốn thao tác trực tiếp trên nhánh chính thì có thể tạo nhánh khác bằng cách git checkout -b rồi nhập tên nhánh phụ đó vào. Sau này muốn gộp nhánh phụ này với nhánh chính thì có thể merge vào nhánh master
- Nếu đó là lần đầu tiên add folder đó lên 1 repo trên github thì cần có thao tác là lấy đường dẫn đến repo trên github. Vẫn trong cmd nhập lệnh git remote add origin và nhập đường dẫn đến repo đó.
- Sau cùng là push lên github thì dùng git push -u origin master, nó sẽ đẩy từ local repo lên remote repo chính là github.
