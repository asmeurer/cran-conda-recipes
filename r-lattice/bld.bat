
copy DESCRIPTION DESCRIPTION.old
type DESCRIPTION.old | find /v "Priority: recommended" > DESCRIPTION

%R_CMD% INSTALL --build .
