# Device Tree for Realme 8 (nashc/RMX3085)
![Realme 8](https://image05.realme.net/general/20210427/1619510447064.png)

|Basic               |Spec Sheet                                                    |
|--                  |--                                                            |
|CPU                 |Octa-core (6x2.0 GHz Cortex-A55 & 2x2.05 GHz Cortex-A76)      |
|Chipset             |MediaTek MT6785 Helio G95                                     |
|GPU                 |ARM Mali-G76 MC4                                              |
|Memory              |4/6GB RAM                                                     |
|Android Version     |11 (RealmeUI 2)                                               |
|Storage             |64/128GB                                                      |

# Custom Recovery Status
What's working?
- Vibration/Haptic 
- Flashing .img/zip
- ADB Sideload
- Terminal/Console
- External Storage (SD and OTG)

Bugs?
- Internal Storage (Encrypted)
- MTP; might need to disable and enable mtp button to work.

Notes:
If you see error like: `Failed to mount /partition_name (Invalid Argument)`, please ignore it for now. It was due to erofs as file-system type in recovery.fstab. I am still thinking if it should be removed or not. 

Kernel Source: [Reame-Kernel-MT6785](https://github.com/nashc-dev/android_kernel_realme_mt6785)
       (...if you want to build recovery with Kernel Source.)
