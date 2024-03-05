use strict;
use warnings;


my $key = "ZHEkjgfhdiIR";
my @flag;
# Define the decryption key and an array to store decrypted content

open(my $fh, '<:raw', 'flag.enc') or die "Cannot open file: $!";
# Open the file 'flag.enc' for reading in binary mode

my $content = do { local $/; <$fh> };
# Read the entire content of the file into a scalar variable
# Change the input record separator temporarily to 'undef' to read the entire file at once

for my $i (0 .. length($content) - 1) {
    # Loop through each byte of the content
    push @flag, ord(substr($content, $i, 1)) ^ ord(substr($key, $i % 12, 1));
    # Extract a single byte from the content and the key, perform XOR operation, and store the result in @flag
}

open(my $file_handler, '>:raw', 'flag.png') or die "Cannot open file: $!";
# Open a new file named 'flag.png' for writing in binary mode

print $file_handler pack('C*', @flag);
# Write the contents of @flag to the file handler
# Convert the array @flag into a string of bytes using the pack function
close($file_handler);

