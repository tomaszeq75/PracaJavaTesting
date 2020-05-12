package com.company;

import java.time.*;

public class Main {

    public static void main(String[] args) {
        LocalDate yesturday = LocalDate.of(2020, 04, 20);
        LocalTime timeStart = LocalTime.now();
        for (int i = 0; i < 50; i++) System.out.println(i + " : " + fib(i));
                LocalTime timeEnd = LocalTime.now();
        System.out.println(timeStart.getNano()/1E6);
        System.out.println(timeEnd.getNano()/1E6);
        System.out.println((timeEnd + " - " + timeStart));
        System.out.println((timeEnd.getNano() - timeStart.getNano())/1E6);

        Duration duration = Duration.between(timeStart, timeEnd);
        System.out.println("to nano:   " + duration.toNanos());
        System.out.println("to s:      " + duration.toSeconds());
        System.out.println("to string: " + duration.toString());
        System.out.println("");
        System.out.println(("duration = " + duration));

    }

    // n-ty element ciągu Fibonnacciego
    public static long fib(long n) {
        if (n < 2) return 1;
        return fib(n - 1) + fib(n - 2);
    }

    public void funkcja() {
        for (int i = 0; i < 10; i++) {
            // TODO dopisać coś aaa bbb ccc
            System.out.println();
        }
    }

}
