package main
import (
        "fmt"
        "os"
        )
const A = 10
const B = 34
func main(){
        c :="package main%[1]cimport (%[1]c        %[2]cfmt%[2]c%[1]c        %[2]cos%[2]c%[1]c        )%[1]cconst A = 10%[1]cconst B = 34%[1]cfunc main(){%[1]c        c :=%[2]c%[3]s%[2]c%[1]c        f, err := os.Create(%[2]cGrace_kid.go%[2]c)%[1]c        if err != nil {return}%[1]c        fmt.Fprintf(f, c, A, B, c)%[1]c        f.Close()}%[1]c//%[1]c//  comment 1%[1]c//"
        f, err := os.Create("Grace_kid.go")
        if err != nil {return}
        fmt.Fprintf(f, c, A, B, c)
        f.Close()}
//
//  comment 1
//