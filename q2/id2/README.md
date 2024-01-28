I decided to go a similar route with the remediation of this CIS Benchmark. Instead of using security templates, I wanted to provide a solution that a Sys Admin might do to remediate the problem.

Here are the instructions:

1. Run the `get_state_of_ASR.ps1` script. This Powershell script gets the current state of the ASR rule.
2. Run the `set_state_of_ASR.ps1` script. This Powershell script sets the state of the specifeid ASR rule (Defender\AttackSurfaceReductionRules_Ids, 26190899-1602-49e8-8b27-eb1d0a1ce869)
3. Verify the changes by running the `verify_changes.ps1` script. This will help you confirm that the ASR changes were successful.

These scripts could easily be consolidated into one script, but for the sake of this exercise and readability, I kept them separate.
