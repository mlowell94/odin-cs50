// A recursive function that outputs fibonacci numbers to an array specified by the parameter. 
// The Odin Project's instructions imply that 0 is the first number in the sequence, rather than the '0th' number in the sequence.

// Line-by-Line explanation:
// Line 19-20: Check if the number is 1 or 0. This returns [0] -- the first number in the sequence.

// Line 21-22: Check if the number is equal to 2 (the actual base case). If so, return [0,1]. All later calculations are based on this array.

// Line 23-24: If the number is greater than 2, call fibsRec recursively on the number - 1. This function will run until the number passed hits 2, at which point
// its return value ([0,1]) is assigned the variable temp.

// Line 25: Push a new item whose value is equal to the sum of the last two items in temp into temp. This index is found by subtracting 3 off the second to last number
// and 2 off of the last number.

// If you want to consider 0 as the 0th member of the sequence rather than the first, you would need to reduce all numbers on lines 19, 21, and 25 by
// one to account for the change

function fibsRec(number) {
    if(number <= 1) {
        return [0];
    } else if(number === 2) {
        return [0,1];
    } else {
        const temp = fibsRec(number - 1);
        temp.push(temp[number - 3] + temp[number - 2]);
        return temp;
    }
}
