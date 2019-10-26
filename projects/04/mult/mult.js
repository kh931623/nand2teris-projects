const mult = (a, b) => {
    let result = 0;
    let count = 0;

    while (count < b) {
        result += a;
        count++;
    }

    return result;
}

console.log(mult(10, 5));