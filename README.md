# project-g1-t3
### All submissions are to be done using GitHub. Submissions via email are ignored.
* Your repository should consist of the following:
* final-presentation.pptx (can be in other format)
* pom.xml Assume mvn command on the PATH environment variable. Reference: https://mkyong.com/maven/how-to-run-unit-test-with-maven
* src/main/java
This directory contains all your Java source files.
* target/classes
This directory is left empty during submission. After compile.bat runs, the class files will be stored here automatically.
* lib (Only if using any external libraries)
This directory contains any jar files that you use for your application.
* sql (for MySQL)
This directory contains the deploy.sql script, and README.txt.
* Only the use of external free or open source libraries (e.g. opencsv) is allowed. No other form of code-sharing is allowed. Co-development of code with members from other teams is a definite NO-NO.

# Instructions
Download Microsoft Edge(old version) if you are having issue opening the login page (Force to download by the browser)
## -----How to run the program ------
1. Run deploy.sql to create the database
2. Run compile.bat
3. Run run.bat
(If any errors occur, use Intellij to run the app instead)
## -------------Login---------------
4. Access the interface with `localhost:9100/login`
5. Use Test account to login: Username: test@smu.sg Password: 123
6. In the homepage, you can sort by selecting the way you want to sort and press `confirm`.
7. To add to favourite, click the `add` button and it will be reflected in favourite tab.
8. To subscribe, click the `subscribe` button
9. click logout and it will lead you to login page.
## ------Forget password------------
10. Click forget password at login page
11. Use Test account to do so: Username: test@smu.sg DoB: 15 Nov 2020
12. Click `submit`
13. Try login with the new password and logout
## ------Register-------------------
14. Click register
15. Fill in all the field
16. Click submit`
17. Login and test
## --------Change API and API call interval-----------
18. Login with admin account: Username: admin@admin.com Password: admin
19. You will see the webservice page. NOTE: You do not need to add all of the field, just what you need to change
20. Click submit and check.
## --------Add or delete email suffix------------------
21. In the admin account, click email settings
22. Type the new suffix you want and click `add`. It will be reflected in the table.
23. Type the suffix you want to delete and click `delete`. It will be removed from the table.
24. logout