function swap(arr, index1, index2) {
    let temp = arr[index1]
    arr[index1] = arr[index2]
    arr[index2] = temp
    return arr
}

function selectionSort(arr) {
    let minValue = arr[0]

    for (let i = 0; i < arr.length; i++) {
        let curValue = arr[i]
        for (let j = i; j < arr.length; j++) {
            console.log(arr)
            if (arr[j] < curValue) swap(arr, i, j)
            console.log(arr)
        }
        
    }
    return arr
}

let arr = [2, 5, 1, 3, 4]
console.log(selectionSort(arr))

module.exports = {
    selectionSort,
    swap
};