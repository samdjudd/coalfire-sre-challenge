My solution to the 2.2.21 CIS Benchmark was to use Powershell scripts and security templates.
I chose this solution because it seemed like the most straight-forward given the use of Windows Server 2019 on the bastion host.
I dont have very much experience with Powershell and Windows, but I believe that simple = readable = good!

The idea for this solution is to follow these steps:
1. Export the current security template file using a Powershell script.
2. Edit the group policy section in the security template with the users/groups that are to be denied access.
3. Import that security template back into the bastion host.


I believe this to be the simplest approach to the problem.
