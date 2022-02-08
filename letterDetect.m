function letter = readLetter(snap)

load NewTemplates
snap = imresize(snap, [42 24]);
rec = [ ];

for n = 1 : length(NewTemplates)
    cor = corr2(NewTemplates{1,n}, snap);
    rec = [rec cor];
end

ind = find(rec == max(rec));
display(ind);

switch (ind)
    case 1 || 2
        letter = 'A';
    case 3 || 4
        letter = 'B';
    case 5
        letter = 'C';
    case 6 || 7
        letter = 'D';
    case 8
        letter = 'E';
    case 9
        letter = 'F';
    case  10
        letter = 'G';
    case 11
        letter = 'H';
    case 12
        letter = 'I';
    case 13
        letter = 'J';
    case 14
        letter = 'K';
    case 15
        letter = 'L';
    case 16
        letter = 'M';
    case 17
        letter = 'N';
    case 18 || 19
        letter = 'O';
    case 20 || 21
        letter = 'P';
    case 22 || 23
        letter = 'Q';
    case 24 || 25
        letter = 'R';
    case 26
        letter = 'S';
    case 27
        letter = 'T';
    case 28
        letter = 'U';
    case 29
        letter = 'V';
    case 30
        letter = 'W';
    case 31
        letter = 'X';
    case 32
        letter = 'Y';
    case 33
        letter = 'Z';
    case 34
        letter = '1';
    case 35
        letter = '2';
    case 36
        letter = '3';
    case 37 || 38
        letter = '4';
    case 39
        letter = '5';
    case 40 || 41 || 42
        letter = '6';
    case 43
        letter = '7';
    case 44 || 45
        letter = '8';
    case 46 || 47 || 48
        letter = '9';
    otherwise
        letter = '0';
end
end