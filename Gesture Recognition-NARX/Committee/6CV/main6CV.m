% 6CV training function for specific NARX net
function [trained6CVnet, predictTestT1, predictTestT2, predictTestT3, predictTestT4, predictTestT5, predictTestT6, stackMovementTest] = main6CV(NARXnet)

% Load 3 Rounds of x, z of each movement for each Person
[ P1_xz ] = serializePersonXZ('GestureData\Person1.xls');
[ P2_xz ] = serializePersonXZ('GestureData\Person2.xls');
[ P3_xz]  = serializePersonXZ('GestureData\Person3.xls');
[ P4_xz ]  = serializePersonXZ('GestureData\Person4.xls');
[ P5_xz ]  = serializePersonXZ('GestureData\Person5.xls');
[ P6_xz ]  = serializePersonXZ('GestureData\Person6.xls'); 


% 6 Fold Cross Validation
[ trained6CVnet, predictTestT1, predictTestT2, predictTestT3, predictTestT4, predictTestT5, predictTestT6, stackMovementTest] ...
                                                                                                                                    = sixFoldCV(NARXnet, P1_xz, P2_xz, P3_xz,P4_xz,P5_xz,P6_xz);
end