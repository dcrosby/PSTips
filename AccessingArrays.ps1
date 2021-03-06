################################################################################
# PowerShell Tips
# http://technet.microsoft.com/en-us/library/hh848797.aspx
#
# Accessing Values in an Array
# http://technet.microsoft.com/en-us/library/ee692791.aspx
#
################################################################################

# Assigning an array - easy shmeasy
$x = 1,2,3,4,5,6,7,8,9,10

# You don't need a For-Loop to access the values in a PS array
$x

# Accessing indexed locations in an array (Remember they're 0-based)
$x[2]
$x[-2]

$x[3..57]

12..21

# More Arrays
# http://technet.microsoft.com/en-us/library/ee692797.aspx
$a = "one", "two", "three"
$a = $a + 4
$a = 1..100

# Create an empty array
$a = @()

$a = $a + 1
$a = $a + 2

$a = 1, "A", (Get-Date)

# Strongly-typed array
[int[]] $a = 1,2,3,4

# These will throw an error or return unexpected results:
$a = $a + "test"
$a = $a + (Get-Date)
$a = $a + 5.12345  # decimals will be stripped off

$c = "one", "two", "three"
$b = "Red, White, Blue"
$d = $b + $c
$d


