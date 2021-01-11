; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"arr\00", align 1
@.str.1 = private unnamed_addr constant [89 x i8] c"/srv/DFSc/cs-teaching/home/u2/areetz/1209-CS136/f20/skeletons/A7/q3-sudoku/array_tools.c\00", align 1
@__PRETTY_FUNCTION__.array_read = private unnamed_addr constant [33 x i8] c"int array_read(int *, const int)\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"max_len > 0\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@__PRETTY_FUNCTION__.array_print = private unnamed_addr constant [41 x i8] c"void array_print(const int *, const int)\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"arr_len >= 0\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"[]\0A\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"[%d\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c", %d\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"]\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define i32 @array_read(i32* %arr, i32 %max_len) #0 {
entry:
  %arr.addr = alloca i32*, align 8
  %max_len.addr = alloca i32, align 4
  %len = alloca i32, align 4
  store i32* %arr, i32** %arr.addr, align 8
  store i32 %max_len, i32* %max_len.addr, align 4
  %0 = load i32*, i32** %arr.addr, align 8
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([89 x i8], [89 x i8]* @.str.1, i64 0, i64 0), i32 7, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__PRETTY_FUNCTION__.array_read, i64 0, i64 0)) #3
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load i32, i32* %max_len.addr, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %if.then1, label %if.else2

if.then1:                                         ; preds = %if.end
  br label %if.end3

if.else2:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([89 x i8], [89 x i8]* @.str.1, i64 0, i64 0), i32 8, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__PRETTY_FUNCTION__.array_read, i64 0, i64 0)) #3
  unreachable

if.end3:                                          ; preds = %if.then1
  store i32 0, i32* %len, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end3
  %2 = load i32, i32* %len, align 4
  %3 = load i32, i32* %max_len.addr, align 4
  %cmp4 = icmp slt i32 %2, %3
  br i1 %cmp4, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %4 = load i32*, i32** %arr.addr, align 8
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i32* %4)
  %cmp5 = icmp eq i32 %call, 1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %5 = phi i1 [ false, %while.cond ], [ %cmp5, %land.rhs ]
  br i1 %5, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %6 = load i32*, i32** %arr.addr, align 8
  %incdec.ptr = getelementptr inbounds i32, i32* %6, i32 1
  store i32* %incdec.ptr, i32** %arr.addr, align 8
  %7 = load i32, i32* %len, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %len, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %8 = load i32, i32* %len, align 4
  ret i32 %8
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

declare i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone
define void @array_print(i32* %arr, i32 %arr_len) #0 {
entry:
  %arr.addr = alloca i32*, align 8
  %arr_len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %arr, i32** %arr.addr, align 8
  store i32 %arr_len, i32* %arr_len.addr, align 4
  %0 = load i32*, i32** %arr.addr, align 8
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([89 x i8], [89 x i8]* @.str.1, i64 0, i64 0), i32 19, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.array_print, i64 0, i64 0)) #3
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load i32, i32* %arr_len.addr, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %if.then1, label %if.else2

if.then1:                                         ; preds = %if.end
  br label %if.end3

if.else2:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([89 x i8], [89 x i8]* @.str.1, i64 0, i64 0), i32 20, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.array_print, i64 0, i64 0)) #3
  unreachable

if.end3:                                          ; preds = %if.then1
  %2 = load i32, i32* %arr_len.addr, align 4
  %cmp4 = icmp eq i32 %2, 0
  br i1 %cmp4, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.end3
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0))
  br label %if.end12

if.else6:                                         ; preds = %if.end3
  %3 = load i32*, i32** %arr.addr, align 8
  %incdec.ptr = getelementptr inbounds i32, i32* %3, i32 1
  store i32* %incdec.ptr, i32** %arr.addr, align 8
  %4 = load i32, i32* %3, align 4
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), i32 %4)
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.else6
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %arr_len.addr, align 4
  %cmp8 = icmp slt i32 %5, %6
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %arr.addr, align 8
  %incdec.ptr9 = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr9, i32** %arr.addr, align 8
  %8 = load i32, i32* %7, align 4
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i32 %8)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  br label %if.end12

if.end12:                                         ; preds = %for.end, %if.then5
  ret void
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!1 = !{i32 1, !"wchar_size", i32 4}
