resource "aws_key_pair" "pub-key" {
    key_name = "mac-new-personal"
    public_key = file("/Users/aselnazarova/just_testdir/pubkey")
}