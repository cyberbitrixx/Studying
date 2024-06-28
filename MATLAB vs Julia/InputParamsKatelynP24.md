# InputParamsKatelynP24 (WIP)
InputParamsKatelynP24 is a file which serves as part of a bigger script used for EEG data analysis which is being collected from rodent brain durin different sleep phases, and as a result build graphs of rodent brain activities in MATLAB.
<br><br>

## Task and Materials
The task here was to translate MATLAB version of this script file to Julia programming language.

#### Code given:
* [InputParamsKatelynP24.m](https://github.com/cyberbitrixx/Studying/blob/54ff3c8461597a18c9665ae81fc6b515486112b0/MATLAB%20vs%20Julia/InputParamsKatelynP24.m) - a file with MATLAB code for InputParamsKatelynP24.
<br><br>

## MATLAB vs Julia: Explanatory

MATLAB:
```matlab
function S = InputParamsKatelynP24
```
* You're not actually defining S as a structure yet. You're simply declaring that the function will return something called S. The S here is just a placeholder for whatever the function will return.
* MATLAB structures are dynamically created and expanded. You don't need to pre-declare them or specify their fields in advance. The structure S is implicitly created and expanded within the function as you assign values to its fields.


Julia:
```julia
function InputParamsKatelynP24()
S = Dict{String, Any}()
```

* In Julia we define InputParamsKatelynP24 as function that takes no parameters ("()").
* Unlike in MATLAB where return value is being declared initially with function declaration, in Julia we declare return value separately as "S = Dict{String, Any}()".
* Using Dictionary instead of a Structure like in MATLAB. Julia's dictionaries are more flexible and similar to Python dictionaries.
<br><br>

MATLAB:
```matlab
S.epochs = 900
```
Julia:
```julia
S["epochs"] = 900
```
* Julia uses square bracket notation for dictionary access, while MATLAB uses dot notation for struct fields.
<br><br>

MATLAB:
```matlab
S.Light = ([1:10800]);
```

Julia:
```julia
S["Light"] = 1:10800
```
* This creates a range from 1 to 10800 and assigns it to the "Light" key.
* Julia's ranges are more memory-efficient as they're not immediately expanded into full arrays.
