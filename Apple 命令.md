# Apple 命令

## 以下是使用 `pmset -g` 命令查看的当前电源管理设置的输出及其解释

1. **standby: 1**
   - 启用了待机模式，系统在休眠一段时间后会进入更深度的节能状态。

2. **Sleep On Power Button: 1**
   - 当按下电源按钮时，Mac 将会进入睡眠模式。

3. **hibernatefile: /var/vm/sleepimage**
   - 系统的休眠映像文件位置，当 Mac 进入休眠时，它会将内存内容写入此文件。

4. **powernap: 1**
   - Power Nap 功能启用时，即使 Mac 处于睡眠状态，它仍然可以执行一些后台任务，如检查电子邮件、日历事件、软件更新等。

5. **networkoversleep: 0**
   - 在睡眠状态下，Mac 不会通过网络唤醒。

6. **disksleep: 10**
   - Mac 空闲 10 分钟后，硬盘将进入睡眠状态，以节省电力。

7. **sleep: 1**
   - 主睡眠计时器，表示 Mac 会在 1 分钟后进入睡眠状态（但目前被一些进程阻止，如 powerd、sharingd、Finder 和 coreaudiod）。

8. **hibernatemode: 3**
   - 混合睡眠模式，内存内容会保存到磁盘（休眠文件），同时保持内存供电。当电池电量低时，系统会从磁盘中恢复。

9. **ttyskeepawake: 1**
   - 当有打开的终端会话（TTYs）时，系统不会进入睡眠状态。

10. **displaysleep: 0**
    - 显示器不会自动进入睡眠状态。

11. **tcpkeepalive: 1**
    - 系统在睡眠状态下保持 TCP 连接活跃，确保网络服务不会中断。

12. **powermode: 2**
    - macOS 的低功耗模式设置之一，数值越高，系统可能会更加节能。

13. **womp: 0**
    - 关闭了 **Wake on Magic Packet**（通过网络唤醒），这意味着你的 Mac 无法通过网络信号唤醒。

### 恢复默认设置

```sh
sudo pmset restoredefaults
```



##  查看 cpu

```sh
sudo powermetrics --samplers cpu_power
```

## 查看内存压力

```sh
sudo memory_pressure
```

以下是系统内存状态的总结，已进行格式优化：

1. **系统内存总量**：
   - 系统总内存：38,654,705,664 字节（约 36 GB）
   - 内存页面大小：16,384 字节（16 KB）
   - 总内存页数：2,359,296

2. **内存页状态**：
   - 空闲内存页：33,684 页（约 524 MB）
   - 可清除内存页：183,596 页（约 2.8 GB）
   - 已清除内存页：12,373,066 页

3. **交换 I/O（Swap I/O）**：
   - 从交换空间加载到内存的页面数：32,648 页
   - 内存交换到磁盘的页面数：124,191 页

4. **页面队列计数（Page Q counts）**：
   - 活动内存页：977,967 页（约 14.9 GB）
   - 非活动内存页：944,118 页（约 14.4 GB）
   - 推测性内存页：46,829 页（约 732 MB）
   - 被限制的内存页：0 页
   - 锁定内存页：191,507 页（约 3 GB）

5. **压缩器统计（Compressor Stats）**：
   - 压缩器使用的内存页：108,155 页（约 1.65 GB）
   - 解压回内存的页面数：9,763,175 页
   - 已压缩的页面数：14,253,134 页

6. **文件 I/O（File I/O）**：
   - 从磁盘加载到内存的文件页面数：10,364,056 页
   - 从内存写回到磁盘的文件页面数：466,777 页

7. **系统内存空闲百分比**：
   - 系统内存空闲百分比：86%

总结：系统的大部分内存处于空闲或可回收状态（86%），表明系统当前有大量可用内存。部分页面已经交换到磁盘或通过压缩器压缩以节省内存空间。



## 内存带宽查看

macbook pro 的读写可以达到 200GB/S,

```sh
WARNING -- The above is only a rough guideline.
For best results, please be sure you know the
precision of your system timer.
-------------------------------------------------------------
Function    Best Rate MB/s  Avg time     Min time     Max time
Copy:          204351.0     0.000828     0.000783     0.000933
Scale:         193007.9     0.000870     0.000829     0.000968
Add:           166001.5     0.001501     0.001446     0.001556
Triad:         167131.5     0.001506     0.001436     0.001570
-------------------------------------------------------------
Solution Validates: avg error less than 1.000000e-13 on all three arrays
-------------------------------------------------------------
leojackasher@leojackasherdeMacBook-Pro tmp % 

```

这是 macbook Air 的内存带宽, 只有 55GB/S,小了很多

```sh
precision of your system timer.
-------------------------------------------------------------
Function    Best Rate MB/s  Avg time     Min time     Max time
Copy:           55056.9     0.003326     0.002906     0.003575
Scale:          45506.8     0.004052     0.003516     0.004728
Add:            44876.9     0.005830     0.005348     0.006646
Triad:          45258.2     0.005861     0.005303     0.006746
-------------------------------------------------------------
Solution Validates: avg error less than 1.000000e-13 on all three arrays
```

打开文件检索(Spotlight)：`sudo mdutil -a -i on`  `sudo mdutil -E /`
关闭文件检索(Spotlight)：sudo mdutil -a -i off 

关闭前

```sh
CPU Power: 1149 mW
GPU Power: 32 mW
ANE Power: 0 mW
Combined Power (CPU + GPU + ANE): 1181 mW
```

关闭后

```sh
CPU Power: 858 mW
GPU Power: 35 mW
ANE Power: 0 mW
Combined Power (CPU + GPU + ANE): 893 mW
```

好像并没有什么用.....

## 内存交换

```sh
leojackasher@leojackasherdeMacBook-Pro leojackasher % vm_stat

Mach Virtual Memory Statistics: (page size of 16384 bytes)
Pages free:                               18660.
Pages active:                            657327.
Pages inactive:                          656870.
Pages speculative:                          566.
Pages throttled:                              0.
Pages wired down:                        275610.
Pages purgeable:                          93652.
"Translation faults":                1694435670.
Pages copy-on-write:                   57165632.
Pages zero filled:                   1043040697.
Pages reactivated:                    103361766.
Pages purged:                          39991898.
File-backed pages:                       436701.
Anonymous pages:                         878062.
Pages stored in compressor:             1636585.
Pages occupied by compressor:            693554.
Decompressions:                        78999421.
Compressions:                          95061680.
Pageins:                               20957857.
Pageouts:                               1932868.
Swapins:                                  23073.
Swapouts:                                 43424.

```

### 解释

**关键参数解释：**

- **Pages free**: 18660 页（大约 305MB）
  当前系统中的空闲内存页面数量。
- **Pages active**: 657327 页（大约 10GB）
  活跃的内存页面，表示当前正在使用的内存。
- **Pages inactive**: 656870 页（大约 10GB）
  处于非活跃状态的页面，可能是最近未被访问的页面，但仍然保存在内存中以备将来使用。
- **Pages speculative**: 566 页（大约 9MB）
  预测性加载的页面，系统可能认为这些页面会很快被使用，因此预先加载。
- **Pages wired down**: 275610 页（大约 4.2GB）
  被锁定的页面，无法被交换到磁盘中，因为它们对于内核或关键系统进程是必须的。
- **Pages purgeable**: 93652 页（大约 1.43GB）
  可清理的页面，系统可以在需要更多内存时将其释放。
- **Pageins**: 20957857
  从磁盘加载到内存的页面数量（即从磁盘读取到内存中）。
- **Pageouts**: 1932868
  从内存交换到磁盘的页面数量（即写入到交换文件中的页面）。
- **Swapins**: 23073
  从交换空间加载回内存的页面数量。表示某些被交换出去的页面已经被重新加载到内存中。
- **Swapouts**: 43424
  从内存交换到磁盘的页面数量。表示内存不足时，操作系统将页面交换到磁盘的数量。
- **Pages stored in compressor**: 1636585（大约 25GB） 被压缩并存储在内存压缩器中的页面数量。
- **Pages occupied by compressor**: 693554（大约 10.5GB） 内存压缩器占用的物理内存数量。
- **Decompressions**: 78999421
  从压缩内存中恢复（解压缩）页面的次数。
- **Compressions**: 95061680
  将页面压缩以节省物理内存的次数。

### 分析：

1. **交换（Swap）活动**：
   - `Swapins: 23073` 和 `Swapouts: 43424` 表示一些内存页面确实被交换到了磁盘，并且其中一些已经被重新加载回内存。不过交换活动不是特别大，这表明系统总体上还没有频繁使用交换空间。
2. **内存压缩**：
   - `Pages stored in compressor: 1636585` 和 `Pages occupied by compressor: 693554` 显示系统在大量使用内存压缩。这意味着虽然物理内存紧张，但系统还没有大量依赖磁盘交换，而是通过内存压缩减少了对交换的需求。
3. **内存利用率**：
   - 系统当前有大约 **10GB** 的活跃内存，约 **10GB** 的非活跃内存，和 **4.2GB** 的锁定内存。空闲内存只有大约 **305MB**，这意味着内存使用接近饱和，但通过压缩和交换机制维持系统运行。

## 打开未知软件

```sh
sudo spctl --master-disable
```

