---
marp: true
theme: flatcar
paginate: true
size: 16:9
title: "Flatcar Linux: Provisioned, Not Installed"
author: Jan Bronicki
---

<!-- _class: cover -->
<!-- _paginate: false -->

# Flatcar Linux: Provisioned, Not Installed

## A declarative and Immutable Operating Systems for Containers and Kubernetes

##### Jan Bronicki

---

<!-- _class: sidebar whoami -->

# whoami

<div class="pin-tr" style="display: flex; gap: 20px; align-items: center">
  <img class="img-h-xs" src="./assets/logos/external/flatcar-logo-other.png" alt="Flatcar">
  <img class="img-h-xs" src="./assets/logos/external/microsoft.png" alt="Microsoft">
</div>


## Jan Bronicki

Flatcar Maintainer

Software Engineer @ Microsoft

<img class="bio-photo" style="--bio-photo-size: 320px; top: 180px" src="assets/photo/individual_photos/jan-bronicki.jpg" alt="Jan Bronicki">

<p class="bio-github"><img src="assets/logos/external/github-white.png" alt="GitHub">@John15321</p>

---

<!-- _class: agenda -->

# Agenda

- The community behind Flatcar
- What Flatcar Container Linux actually is
- Provisioned, not installed
- Immutable by design & A/B updates
- Live demo

---

<!-- _class: section -->

# Community Stewarded

## What that means, and who we are

---

<!-- _class: sidebar -->

# Community stewarded

- **Fully open, fully free:** Apache 2.0, public roadmap, public issue tracker
- **No single owner:** the project and trademark belong to the CNCF and the Linux Foundation
- **CNCF project:** neutral governance under the Cloud Native Computing Foundation
- **You can join:** SIG meetings are public; anyone can propose changes or maintain

<div class="cncf-banner">
  <p class="cncf-banner-caption">Flatcar is a <strong>CNCF</strong> project</p>
  <img src="assets/logos/external/cncf-banner.png" alt="Cloud Native Computing Foundation">
</div>

---

<!-- _class: sidebar -->

# The community

<div style="position: relative; width: 100%; height: 620px; margin-top: 4px">
  <img style="position: absolute; left: -4%; top: -2%; width: 42%; box-shadow: 0 10px 26px rgba(0,0,0,.32)" src="assets/photo/group_photos/image13.jpeg" alt="">
  <img style="position: absolute; left: 50%; top: -4%; width: 46%; box-shadow: 0 10px 26px rgba(0,0,0,.32)" src="assets/photo/group_photos/image16.jpeg" alt="">
  <img style="position: absolute; left: 22%; top: 4%;  width: 42%; box-shadow: 0 10px 26px rgba(0,0,0,.32); z-index: 2" src="assets/photo/group_photos/image14.jpeg" alt="">
  <img style="position: absolute; left: 0%; top: 36%; width: 42%; box-shadow: 0 10px 26px rgba(0,0,0,.32); z-index: 2" src="assets/photo/group_photos/image17.jpeg" alt="">
  <img style="position: absolute; left: 58%; top: 22%; width: 42%; box-shadow: 0 10px 26px rgba(0,0,0,.32); z-index: 2" src="assets/photo/group_photos/image18.jpeg" alt="">
  <img style="position: absolute; left: 18%; top: 28%; width: 52%; box-shadow: 0 14px 32px rgba(0,0,0,.38); z-index: 4" src="assets/photo/group_photos/image15.jpeg" alt="">
  <img style="position: absolute; left: 42%; top: 54%; width: 54%; box-shadow: 0 12px 28px rgba(0,0,0,.34); z-index: 3" src="assets/photo/group_photos/image19.jpeg" alt="">
</div>

---

<!-- _class: sidebar -->

# We work with

- **Gentoo** and **Fedora CoreOS**
- **systemd**, **Dracut**, **Grub**, **Afterburn**
- Openwall **oss-security** non-disclosure list
- Co-founders of the **UAPI Group**, cross-distro SIG for image-based Linux

<div class="logo-wall logo-wall-lg" style="grid-template-columns: repeat(4, 1fr); margin-top: 18px">
  <img src="assets/logos/external/gentoo-logo.png" alt="Gentoo" style="transform: translateY(90px); transform-origin: center">
  <img src="assets/logos/external/fedora-coreos-logo.svg" alt="Fedora CoreOS" style="transform: translateY(20px); transform-origin: center">
  <img src="assets/logos/external/clouds/Systemd-logo.svg" alt="systemd" style="transform: scale(1.35) translateY(100px); transform-origin: center">
  <img src="assets/logos/external/linux-logo.png" alt="Linux" style="transform: translateY(30px); transform-origin: center">
</div>

---

<!-- _class: sidebar -->

# Runs everywhere

<div class="logo-wall" style="grid-template-columns: repeat(5, 1fr); grid-template-rows: repeat(4, 1fr); gap: 20px 28px; height: 530px; margin-top: 8px">
  <img src="assets/logos/external/clouds/aws-logo.svg" alt="AWS">
  <img src="assets/logos/external/clouds/azure.svg" alt="Azure">
  <img src="assets/logos/external/clouds/gcp.png" alt="GCP">
  <img src="assets/logos/external/clouds/oracle-cloud-logo.png" alt="Oracle Cloud">
  <img src="assets/logos/external/clouds/openstack.png" alt="OpenStack">

  <img src="assets/logos/external/clouds/stackit-logo.svg" alt="STACKIT">
  <img src="assets/logos/external/clouds/ovhcloud-seeklogo.svg" alt="OVHcloud">
  <img src="assets/logos/external/clouds/scaleway.png" alt="Scaleway">
  <img src="assets/logos/external/clouds/hetzner.png" alt="Hetzner">
  <img src="assets/logos/external/clouds/DigitalOcean_logo.svg" alt="DigitalOcean">

  <img src="assets/logos/external/clouds/akamai-logo.svg" alt="Akamai">
  <img src="assets/logos/external/clouds/exoscale-seeklogo.svg" alt="Exoscale">
  <img src="assets/logos/external/clouds/brightbox-logo.svg" alt="Brightbox">
  <img src="assets/logos/external/clouds/PlusServer-Logo.svg" alt="plusserver">

  <img src="assets/logos/external/clouds/Vmware.svg" alt="VMware">
  <img src="assets/logos/external/clouds/Logo_Proxmox.svg" alt="Proxmox">
  <img src="assets/logos/external/clouds/Qemu_logo.svg" alt="QEMU">
  <img src="assets/logos/external/clouds/kube-virt.svg" alt="KubeVirt">
  <img src="assets/logos/external/clouds/libvirt-logo.svg" alt="libvirt">
  <img src="assets/logos/external/clouds/vagrant.svg" alt="Vagrant">
</div>

---

<!-- _class: sidebar -->

# In production at

<div class="logo-wall logo-wall-lg" style="grid-template-columns: repeat(5, 1fr); grid-template-rows: repeat(3, 1fr); gap: 20px 32px; height: 530px; margin-top: 8px">
  <img src="assets/logos/external/companies/Adobe_Corporate_logo.svg" alt="Adobe">
  <img src="assets/logos/external/companies/atnt.png" alt="AT&T">
  <img src="assets/logos/external/companies/deepl.png" alt="DeepL">
  <img src="assets/logos/external/companies/giantswarm.png" alt="Giant Swarm">
  <img src="assets/logos/external/companies/stackit.png" alt="STACKIT">

  <img src="assets/logos/external/companies/qualys.png" alt="Qualys">
  <img src="assets/logos/external/companies/wipro.png" alt="Wipro">
  <img src="assets/logos/external/companies/equinix.png" alt="Equinix">
  <img src="assets/logos/external/companies/NAV_logo_rød.svg" alt="NAV">
  <img src="assets/logos/external/companies/Finleap_idD9GhopR0_0.svg" alt="Finleap">

  <img src="assets/logos/external/companies/Hedgehog-color-large.svg" alt="Hedgehog">
  <img src="assets/logos/external/companies/digital-science-logo.svg" alt="Digital Science">
  <img src="assets/logos/external/clouds/cloudbasesol-logo_hu_5371da61cf7b0047.webp" alt="Cloudbase Solutions">
  <img src="assets/logos/external/clouds/cloudscale_hu_17df2ff04c9be12e.webp" alt="cloudscale.ch">
  <img src="assets/logos/external/companies/alopeyk.png" alt="Alopeyk" style="max-height: 140px">
</div>

---

<!-- _class: section -->

# How Flatcar Works

## What is it, and how do you use it?

---

# Flatcar?

<img class="pin-mc" style="max-width: 80%; max-height: 60%; object-fit: contain" src="assets/logos/external/other/flatcar-empty.jpeg" alt="An empty flatcar train wagon">

---

# Flatcar!

<img class="pin-mc" style="max-width: 80%; max-height: 60%; object-fit: contain" src="assets/logos/external/other/flatcar-with-cargo.jpeg" alt="A flatcar loaded with shipping containers">

---

<!-- _class: lead -->

# The UX we chose

<div class="cols-2" style="gap: 60px; margin-top: 20px; align-items: end">

<div style="text-align: center">
  <div style="position: relative">
    <img style="display: block; width: 100%; max-height: 380px; object-fit: contain" src="assets/logos/external/other/unix-ux.png" alt="General-purpose Linux">
    <svg viewBox="0 0 100 100" preserveAspectRatio="none" style="position: absolute; inset: 0; width: 100%; height: 100%; pointer-events: none">
      <line x1="2" y1="2" x2="98" y2="98" stroke="#e53935" stroke-width="4"/>
      <line x1="98" y1="2" x2="2" y2="98" stroke="#e53935" stroke-width="4"/>
    </svg>
  </div>
  <p style="font-weight: 700; margin: 12px 0 0 0">General-purpose Linux</p>
</div>

<div style="text-align: center">
  <img style="display: block; margin: 0 auto; max-width: 60%; max-height: 380px; object-fit: contain" src="assets/logos/external/other/flip-switch.png" alt="Flatcar">
  <p style="font-weight: 700; margin: 12px 0 0 0">Flatcar</p>
</div>

</div>

---

<!-- _class: lead -->

# You don't install Flatcar.

## You provision it.

---

<!-- _class: sidebar -->

# Provisioned, not Installed

<div class="cols-2" style="align-items: start; gap: 40px; margin-top: 12px">

<div>

**Traditional install**

- Interactive choices during setup
- Every machine ends up a little different
- Manual updates, package churn, drift
- No separation between OS and config

</div>

<div>

**Flatcar: provisioned**

- One declarative config, applied at boot
- Every machine identical, reproducible
- Whole-OS atomic updates, no drift
- Same idea as containers

</div>

</div>

---

# Flatcar Workflow

<img style="display: block; margin: auto; max-width: 100%; max-height: 60%; object-fit: contain" src="assets/diagrams/flatcar-workflow.svg" alt="Flatcar workflow: Butane YAML provisions Cloud, VM, or Bare Metal running Containers">

---

# What Butane looks like

```yaml
# Butane config header: declares this is a Flatcar config
variant: flatcar
version: 1.0.0

# Drop in a systemd unit. Flatcar installs and starts it at first boot
systemd:
  units:
    - name: nginx.service
      enabled: true
      contents: |
        [Service]
        ExecStart=/usr/bin/docker run --rm -p 80:80 nginx
        [Install]
        WantedBy=multi-user.target
```


---

# Boot it in a VM

```bash
# Transpile Butane to an ignition config (JSON)
$ butane -o config.ign config.bu

# Boot Flatcar in QEMU with the config applied
$ ./flatcar_production_qemu.sh -i config.ign
```


<div class="callout">
The config gets handed to Flatcar as <strong>user-data</strong>. Same channel every major cloud, hypervisor, and bare-metal provisioner uses to seed an instance.
</div>

---

# It came up serving

```console
$ systemctl is-active nginx.service
active

$ curl -sI http://localhost
HTTP/1.1 200 OK
Server: nginx/1.27.3
Content-Type: text/html
```

No login. No post-boot setup. The machine came up already doing its job.

---

<!-- _class: sidebar -->

# Immutable by Design

- **First boot** provisions from config. After that: the base OS doesn't change.
- The OS is **read-only** and **dm-verity protected**.
- **No package updates**: the entire OS updates as one unit.
- Same config + same base image = **identical machine every time**.
- **sysexts** for optional add-ons.

---

<!-- _class: sidebar -->

# A/B Updates

<div class="ab-slide">
<div class="ab-wrap">
  <div class="ab-stack">
    <div class="ab-card">
      <div class="ab-title"><span class="ab-num">1</span>Fresh install</div>
      <div class="ab-slots">
        <div class="ab-slot active"><span class="ab-label">A</span><span class="ab-ver">1.2.3</span></div>
        <div class="ab-slot passive"><span class="ab-label">B</span><span class="ab-ver">1.2.3</span></div>
      </div>
      <div class="ab-caption">Image ships both slots identical. Only true at first boot.</div>
    </div>
    <div class="ab-card">
      <div class="ab-title"><span class="ab-num">2</span>Update staged</div>
      <div class="ab-slots">
        <div class="ab-slot active"><span class="ab-label">A</span><span class="ab-ver">1.2.3</span></div>
        <div class="ab-slot staged"><span class="ab-label">B</span><span class="ab-ver">1.2.4</span></div>
      </div>
      <div class="ab-caption">New image written over the passive slot. No downtime.</div>
    </div>
    <div class="ab-card">
      <div class="ab-title"><span class="ab-num">3</span>Reboot swaps</div>
      <div class="ab-slots">
        <div class="ab-slot passive"><span class="ab-label">A</span><span class="ab-ver">1.2.3</span></div>
        <div class="ab-slot active"><span class="ab-label">B</span><span class="ab-ver">1.2.4</span></div>
      </div>
      <div class="ab-caption">Boot flips to B. If it fails, reboot back to A at 1.2.3.</div>
    </div>
    <div class="ab-card">
      <div class="ab-title"><span class="ab-num">4</span>Steady running</div>
      <div class="ab-slots">
        <div class="ab-slot passive"><span class="ab-label">A</span><span class="ab-ver">1.2.3</span></div>
        <div class="ab-slot active"><span class="ab-label">B</span><span class="ab-ver">1.2.4</span></div>
      </div>
      <div class="ab-caption">B live. A untouched: it's your rollback target.</div>
    </div>
    <div class="ab-card">
      <div class="ab-title"><span class="ab-num">5</span>Next update</div>
      <div class="ab-slots">
        <div class="ab-slot staged"><span class="ab-label">A</span><span class="ab-ver">1.2.5</span></div>
        <div class="ab-slot active"><span class="ab-label">B</span><span class="ab-ver">1.2.4</span></div>
      </div>
      <div class="ab-caption">1.2.5 overwrites the old 1.2.3 on A. Next reboot: A active, B rollback.</div>
    </div>
  </div>
  <div class="ab-cycle-icon" aria-hidden="true">
    <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><path d="M 50 12 A 38 38 0 1 1 12 50" fill="none" stroke="#12172B" stroke-width="7" stroke-linecap="round"/><polygon points="12,32 3,52 21,52" fill="#12172B"/></svg>
  </div>
</div>
<div class="ab-cycle">↺ The passive slot is <strong>never auto-synced</strong>. It's your rollback until the next update lands.</div>
</div>

---


# Channels

<img style="display: block; margin: 0 auto 16px; max-width: 100%; max-height: 240px; object-fit: contain" src="assets/logos/external/other/flatcar-release-channels.png" alt="Alpha to Beta to Stable release flow">

- **Alpha**: fully tested, may have incomplete features. Developers.
- **Beta**: production-ready. Canary alongside stable.
- **Stable**: widespread production. Promoted from beta.
- **LTS**: slower-moving track for environments that need it.

<div class="callout">
Every commit runs the full test suite: unit, integration, and product tests across every supported cloud. By the time a version ships, even <strong>Alpha</strong>, it's been through hundreds of runs.
</div>

---

<!-- _class: lead -->

# Demos!

## github.com/John15321/demos

---

<!-- _class: closing -->
<!-- _paginate: false -->

# Thank you!

<p class="closing-qr-caption"><img src="assets/logos/external/discord-white.svg" alt=""> Join our Discord!</p>

<p class="closing-links">
  <a href="https://flatcar.org"><img src="assets/logos/flatcar-logotype/icon/white/flatcar-icon-white.svg" alt=""> flatcar.org</a>
  <a href="https://github.com/flatcar"><img src="assets/logos/external/github-white.png" alt=""> github.com/flatcar</a>
  <a href="https://discord.gg/PMYjFUsJyq"><img src="assets/logos/external/discord-white.svg" alt=""> discord.gg/PMYjFUsJyq</a>
</p>

<p class="closing-meetings">
  <span><strong>Office hours</strong> · every 2nd Tue, 16:30 CEST</span>
  <span><strong>Dev sync</strong> · every 4th Tue, 16:30 CEST</span>
</p>

<p class="closing-cta"><strong>Everyone welcome.</strong> Users, contributors, or just curious. Ask questions, get help, share what you're building!</p>
