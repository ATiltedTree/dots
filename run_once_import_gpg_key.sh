# Get from bitwarden and base64 decode and import
echo "{{ (bitwarden "item" "GPG Key").notes }}" | base64 -d | gpg --import

# Set trust to owner
echo "A6B522E3A216DB67F519D493A95E199988004B62:6:" | gpg --import-ownertrust
