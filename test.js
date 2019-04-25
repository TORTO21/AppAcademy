function quicksort(arr, comparisonFunc) {
  if (arr.length <= 1) return arr;

  if(!comparisonFunc) {
    comparisonFunc = function(x, y) {
      if (x < y) return -1;
      if (x > y) return 1;
      return 0;
    }
  }

  const pivot = arr[0];
  const left = [];
  const right = [];
  arr.forEach(function(el, idx) {
    if (idx !== 0) {
      if comparisonFunc(pivot, el) === -1 {
        left.push(el);
      } else {
        right.push(el);
      }
    }
  });
  return quicksort(left, comparisonFunc) + [pivot] + quicksort(right, comparisonFunc);
}