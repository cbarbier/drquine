package main
import "fmt"
//
//  comment 1
//
func print(str string){fmt.Printf(str, 10, 34, str);}
func main(){
//
//  comment 2
//
        c :="package main%[1]cimport %[2]cfmt%[2]c%[1]c//%[1]c//  comment 1%[1]c//%[1]cfunc print(str string){fmt.Printf(str, 10, 34, str);}%[1]cfunc main(){%[1]c//%[1]c//  comment 2%[1]c//%[1]c        c :=%[2]c%[3]s%[2]c;%[1]c        print(c);%[1]c}";
        print(c);
}