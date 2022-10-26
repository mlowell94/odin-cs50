/**
/*Sorts arrays using an implementation of the merge sort algorithm.
/@param {array} : the array to be sorted.
/@returns : the sorted array.
*/

function mergSort(array) {
    if(array.length < 2) {
        return array;
    } else {
        const lSide = mergSort(array.slice(0, Math.floor(array.length / 2)));
        const rSide = mergSort(array.slice(Math.floor(array.length / 2)));
        let rPointer = 0;
        let lPointer = 0;
        let counter = 0;
        let newArray = [];
        while(counter != (lSide.length + rSide.length)) {
            if(rSide[rPointer] > lSide[lPointer] || rSide[rPointer] === undefined) {
                newArray.push(lSide[lPointer]);
                lPointer += 1;
            } else if (rSide[rPointer] < lSide[lPointer] || lSide[lPointer] === undefined) {
                newArray.push(rSide[rPointer]);
                rPointer += 1;
            } 
            counter += 1;
        }
        return newArray;
    }
}

// Line-by-Line explanation: 
// Lines 8 - 9: Checks the array's length. If the length is less than 2, it is already sorted. 
// Line 11: Assign the sorted left half of the array to the variable 'lSide'.
// Line 12: Assign the sorted right half of the array to the variable 'rSide'.
  // These work by breaking down the halves of the array until they equal length < 2, at which point the while loop will run.
// Lines 13 - 16: Initialize variables that will be used during the actual merge operation. r/lPointer track the current lowest number in the 
// halves that will be merged, while counter determines when the arrays have finished merging. 
// Line 17: Create a while loop that runs until the counter (which increments on every loop) is equal to the combined lengths of both halves.
  // This works because one item from each array is entering newArray on every run of the loop. On addition of a new item, the counter increments by one.
  // Once every item has been added, the counter will equal the length of lSide and rSide combined, and stop the while loop.
// Lines 18 - 20: If the current item lPointer is pointing at is less than the current item rPointer is pointing at, that item is added to the array, 
// and lPointer is incremented by 1.
  // The undefined condition checks to see if the entirety of rSide has been dealt with. If rSide[rPointer] === undefined then all numbers from rSide are in 
  //newArray already
// Lines 21 - 23: The same logic as 18-20 but reversed to see if rSide is entering newArray.
// Line 25: Increment the counter by 1.
// Line 27: Return newArray.
