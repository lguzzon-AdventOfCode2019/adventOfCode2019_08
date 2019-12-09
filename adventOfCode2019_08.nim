
import strutils
import sequtils


const
  gcXWide = 25i64
  gcYTall = 6i64
  gcImage = "input".readFile
  gcImageLen = gcImage.len
  gcImageMaxIndex = gcImageLen.pred
  gcLayerLen = gcXWide * gcYTall
  gcLayersCount = gcImageLen div gcLayerLen
  gcLayersMaxIndex = gcLayersCount.pred

proc partOne =
  var lResultMin = BiggestInt.high
  var lResultIndex = BiggestInt.high
  var lLayers : array[gcLayersCount,array[3, BiggestInt]]
  for lIndex in 0..gcImageMaxIndex:
    lLayers[lIndex div gcLayerLen][gcImage[lIndex].ord - '0'.ord].inc
  for lLayerIndex in 0..gcLayersMaxIndex:
    if lResultMin > lLayers[lLayerIndex][0]:
      lResultMin = lLayers[lLayerIndex][0]
      lResultIndex = lLayerIndex        
  let lResult = lLayers[lResultIndex][1] * lLayers[lResultIndex][2]
  echo "partOne $1"%[$lResult]

proc partTwo =
  var lDisplay : array[gcYTall,array[gcXWide,string]]
  for y in 0..gcYTall.pred:
    for x in 0..gcXWide.pred:
      block Layer:
        for l in 0..gcLayersMaxIndex:
          case gcImage[x + y * gcXWide + l * gcLayerLen]
          of '0':
            lDisplay[y][x] = " "
            break Layer
          of '1':
            lDisplay[y][x]="0"
            break Layer
          else:
            discard
  for y in 0..gcYTall.pred:
    echo foldl(lDisplay[y],a & b)


partOne() #1224
partTwo() #EBZUR
