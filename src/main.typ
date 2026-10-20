#import "@preview/modern-cv:0.10.0": *

#show: resume.with(
  author: (
    firstname: "Keaton",
    lastname: "Clark",
    email: "root@keatonclark.dev",
    github: "KeatonClark",
    linkedin: "keaton-clark-64a702207",
    address: "Reno, NV",
    positions: ("Firmware Engineer", "Embedded Systems")
  ),
  profile-picture: none,
  date: sys.inputs.at("version", default: ""),
  paper-size: "us-letter"
)

= Experience

#resume-entry(
  title: "HORIBA Semiconductor",
  location: "Reno, NV",
  date: "May 2023 - Present",
  description: "Firmware Engineer II",
)

#resume-item[
  - *Heterogeneous systems architecture:* 
    Architected and implemented an end-to-end Asymmetric Multi-Processing system spanning Yocto Linux, FreeRTOS coprocessors using RPMsg, a parallel FPGA memory interface using PeakRDL generated registers, and a remote processor using a custom protocol.
    Designed the communication protocol and implemented supporting firmware and FPGA RTL.
  - *Embedded Linux and Yocto:* 
    Own Yocto Linux development for TI AM64x and Xilinx MPSoC platforms, including device trees, custom distributions, and reusable BitBake recipes.
    Implemented the production software update system for a product entering mass production, integrating RAUC, read-only overlay filesystems, EtherCAT FoE, and network-based update transport, with a Rust-based production support CLI.
  - *Firmware platform engineering:* 
    Rebuilt the firmware development framework around Nix, CMake, and GCC, cutting build and test turnaround from several minutes to under 30 seconds. 
    Introduced reproducible, Copy Exact! environments, one-command provisioning, and reusable project templates adopted by five projects within six months.
  - *Modern C++ and testing:* 
    Modernized our internal firmware framework to C++20 using concepts, CRTP, and standard-library abstractions.
    Established QEMU-based unit testing executed on every commit.
  - *Engineering infrastructure:* 
    Built and now co-maintain a Proxmox CI platform supporting 10 engineers across two locations and 40+ pipelines, replacing underpowered IT-managed infrastructure and standardizing firmware and software distribution.
]

#resume-entry(
  title: "Finsure",
  location: "Remote",
  date: "May 2022 - Nov 2022",
  description: "Full Stack Intern",
)

#resume-item[
  - Architected a web application and data service for the insurtech ecosystem, developing over 200 web-scraping scripts and a database containing more than 100,000 records.
  - Presented the project and its progress at ITC Vegas, a major insurance industry conference.
]

= Projects

#resume-entry(
  title: "Alidade - Open-Source Wireless Keyboard",
  location: "Personal Project",
  date: "2026 - Present",
  description: "Hardware Design and Automation",
)

#resume-item[
  - Designing a custom wireless keyboard PCB integrating low-power management, Bluetooth LE firmware using Embassy, and strain-gauge sensing for a trackpoint.
  - Developing hardware CI/CD with automated ERC/DRC checks and generation of manufacturing packages, pick-and-place files, schematics, and 3D models.
]

= Education

#resume-entry(
  title: "University of Nevada, Reno",
  location: "B.S. in Computer Science",
  date: "August 2020 - May 2024",
  description: "GPA: 3.6",
)

= Skills

#resume-skill-item(
  "Languages",
  ( "C", "C++", "Rust", "Python", "Shell", "Nix" )
)
#resume-skill-item(
  "Embedded Systems", 
  ( "FreeRTOS", "Embedded Linux", "Yocto/Bitbake", "RAUC", "U-Boot", "RPMsg" )
)
#resume-skill-item(
  "Design and Verification",
  ( "SystemVerilog", "Verilator", "PeakRDL" )
)
#resume-skill-item(
  "Build and Debug",
  ( "CMake", "GCC", "Clang", "GDB", "OpenOCD", "QEMU")
)
#resume-skill-item(
  "Infrastructure and CI",
  ( "Linux Administration", "Jenkins", "Proxmox" )
)
