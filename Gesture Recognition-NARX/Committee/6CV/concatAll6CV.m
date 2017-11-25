% Simple function to stack up all predicted output from the NARX nets
function[predictTestT] = concatAll6CV(predictTestTn1, predictTestTn2, predictTestTn3)

predictTestT = [predictTestTn1 predictTestTn2 predictTestTn3];

end