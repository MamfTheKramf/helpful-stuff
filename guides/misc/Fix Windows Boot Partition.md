If you've broken your windows boot partition again by installing another OS next to it, try this:
- https://www.reddit.com/r/buildapc/comments/uk0ymt/rebuild_windows_boot_partition_on_drive_with/
- https://learn.microsoft.com/en-us/answers/questions/3163400/accidentally-deleted-windows-10-boot-partition-how?forum=windows-all&referrer=answers
Note on `bcdboot`. You probably want to provide the `/s` option to specify the correct target volume (i.e., the partition you just created)

Also a helpful guide that basically explains the same steps:
- https://www.partitionwizard.com/news/create-efi-partition.html