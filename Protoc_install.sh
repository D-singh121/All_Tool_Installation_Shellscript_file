# sabse pahle hum protoc compiler install karenge.
sudo apt update
sudo apt install protobuf-compiler
protoc --version

# ab hum kush plugins bhi install karenge jo ki protocol compiler ko use hongi.
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# # 'PATH' ko update karenge taki 'protoc' compiler plugins ko find kar sake.
# export PATH="$PATH:$(go env GOPATH)/bin"   # <----- niche implement kiya gya hai.

# # path ko update karne ke liye apne 'HOME' terminal me jake 'nano /.bashrc' file ke last me is path ko add kar denge.
# export PATH=$PATH:$HOME/go/bin   # <------ yaha pe '$HOME' ko apne actual home path se replace kar de. in my case its '/home/dee_singh'

# '/.bash.rc' me path add karne ke baad 'ctrl+o' se file ko save kare. 'Y' ka use confirm save ke liye hota hai.

# # ab shell ko refresh karenge taki change configure ho jaye.
# source ~/.bashrc

# # installed plugins ko verify karne ke liye ye command ka use kare:
# which protoc-gen-go-grpc

# # ab humara grps plugin and path configure hone ke baad hum code generation ki command run kar sake hai.
# protoc --go-grpc_out=. --go_out=. *.proto   #  <----- ye command jaha '.proto' file hai usi folder se run kare.

# 1. protoc: This is the command-line tool used to compile Protocol Buffer definitions.
# 2. --go_grpc_out=.: This flag tells the protoc-gen-go-grpc plugin to generate Go code for gRPC services and place the generated files in the current directory (represented by .).
# 3. --go_out=.: This flag tells the protoc-gen-go plugin to generate regular Go code for the message definitions in the .proto files and also place them in the current directory.
# 4. *.proto: This wildcard argument tells protoc to process all files ending with the .proto extension in the current directory.
