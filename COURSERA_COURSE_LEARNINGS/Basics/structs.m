% Create a struct to hold information about a person
person.name = 'Alice';       % Name field: stores a string
person.age = 30;             % Age field: stores a numeric value
person.scores = [90 85 88];  % Scores field: stores an array of test scores
person.address.city = 'NY';  % Nested struct: address with a city field
person.address.zip = 10001;  % Nested struct: address with a zip code field

% Display the entire struct with disp (no direct fprintf for structs)
disp('Person struct:')
disp(person)

% Access individual fields
fprintf('Name: %s\n', person.name)                   % %s for string field
fprintf('Age: %d\n', person.age)                     % %d for integer field

% Access individual elements in a field which is an array
fprintf('Second score: %d\n', person.scores(2))     

% Access nested struct fields
fprintf('City: %s\n', person.address.city)           
fprintf('ZIP code: %d\n', person.address.zip)      

% Create an array of structs, each element for one student
students(1).name = 'Bob';
students(1).grade = 'A';

students(2).name = 'Carol';
students(2).grade = 'B+';

% Display the names and grades of all students using fprintf inside a loop
for k = 1:length(students)
    fprintf('Student %d: %s (Grade: %s)\n',k,students(k).name,students(k).grade);
end
