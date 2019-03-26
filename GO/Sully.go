package main
import (
        "fmt"
        "os"
        "strings"
        "os/exec"
        )
func main(){
        i := 5
        pgm, _ := os.Executable()
        dec := strings.HasSuffix(strings.ToLower(pgm), "/sully")
        if dec == false {i--}
        c :="package main%[1]cimport (%[1]c        %[2]cfmt%[2]c%[1]c        %[2]cos%[2]c%[1]c        %[2]cstrings%[2]c%[1]c        %[2]cos/exec%[2]c%[1]c        )%[1]cfunc main(){%[1]c        i := %[4]d%[1]c        pgm, _ := os.Executable()%[1]c        dec := strings.HasSuffix(strings.ToLower(pgm), %[2]c/sully%[2]c)%[1]c        if dec == false {i--}%[1]c        c :=%[2]c%[3]s%[2]c%[1]c        src := fmt.Sprintf(%[2]cSully_%%d.go%[2]c, i)%[1]c        exe := fmt.Sprintf(%[2]c./Sully_%%d%[2]c, i)%[1]c        if i<0 {return}%[1]c        f, err := os.Create(src)%[1]c        if err != nil {return}%[1]c        fmt.Fprintf(f, c, 10, 34, c, i)%[1]c        f.Close()%[1]c        if i <= 0 {return}%[1]c        cmd := exec.Command(%[2]cgo%[2]c, %[2]cbuild%[2]c, src)%[1]c        if cmd.Run() != nil {return}%[1]c        exec.Command(exe).Run()}"
        src := fmt.Sprintf("Sully_%d.go", i)
        exe := fmt.Sprintf("./Sully_%d", i)
        if i<0 {return}
        f, err := os.Create(src)
        if err != nil {return}
        fmt.Fprintf(f, c, 10, 34, c, i)
        f.Close()
        if i <= 0 {return}
        cmd := exec.Command("go", "build", src)
        if cmd.Run() != nil {return}
        exec.Command(exe).Run()}