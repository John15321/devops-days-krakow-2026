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
- The UX philosophy — functionality, not features
- Immutable by design & A/B updates
- Live demo

---

<!-- _class: section -->

# Community Stewarded

## What that means, and who we are

---

<!-- _class: sidebar -->

# The community

<div style="position: relative; width: 100%; height: 620px; margin-top: 4px">
  <img style="position: absolute; left: -4%; top: -2%; width: 42%; box-shadow: 0 10px 26px rgba(0,0,0,.32)" src="assets/photo/group_photos/image13.jpeg" alt="">
  <img style="position: absolute; left: 50%; top: -4%; width: 46%; box-shadow: 0 10px 26px rgba(0,0,0,.32)" src="assets/photo/group_photos/image16.jpeg" alt="">
  <img style="position: absolute; left: 22%; top: 4%;  width: 42%; box-shadow: 0 10px 26px rgba(0,0,0,.32); z-index: 2" src="assets/photo/group_photos/image14.jpeg" alt="">
  <img style="position: absolute; left: -8%; top: 44%; width: 42%; box-shadow: 0 10px 26px rgba(0,0,0,.32); z-index: 2" src="assets/photo/group_photos/image17.jpeg" alt="">
  <img style="position: absolute; left: 58%; top: 22%; width: 42%; box-shadow: 0 10px 26px rgba(0,0,0,.32); z-index: 2" src="assets/photo/group_photos/image18.jpeg" alt="">
  <img style="position: absolute; left: 18%; top: 22%; width: 52%; box-shadow: 0 14px 32px rgba(0,0,0,.38); z-index: 4" src="assets/photo/group_photos/image15.jpeg" alt="">
  <img style="position: absolute; left: 32%; top: 56%; width: 48%; box-shadow: 0 12px 28px rgba(0,0,0,.34); z-index: 3" src="assets/photo/group_photos/image19.jpeg" alt="">
</div>

---

<!-- _class: sidebar -->

# We work with

- **Gentoo** and **Fedora CoreOS**
- **systemd**, **Dracut**, **Grub**, **Afterburn**
- Openwall **oss-security** non-disclosure list
- Co-founders of the **UAPI Group** — cross-distro SIG for image-based Linux

<div class="row row-center" style="margin-top: 24px; gap: 70px">
  <img style="height: 200px; width: auto" src="assets/logos/external/gentoo-logo.png" alt="Gentoo">
  <img style="height: 100px; width: auto" src="assets/logos/external/fedora-coreos-logo.svg" alt="Fedora CoreOS">
  <img style="height: 200px; width: auto" src="assets/logos/external/systemd.png" alt="systemd">
  <img style="height: 200px; width: auto" src="assets/logos/external/linux-logo.png" alt="Linux">
</div>

---

<!-- _class: sidebar -->

# Runs everywhere

<div style="position: relative; width: 100%; height: 580px; margin-top: 4px">
  <img style="position: absolute; left: 3%;  top: 2%;  max-height: 95px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/aws-logo.svg" alt="AWS">
  <img style="position: absolute; left: 26%; top: 0%;  max-height: 95px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/azure.png" alt="Azure">
  <img style="position: absolute; left: 48%; top: 3%;  max-height: 95px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/gcp.png" alt="GCP">
  <img style="position: absolute; left: 72%; top: 1%;  max-height: 95px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/oracle-cloud-logo.png" alt="Oracle Cloud">

  <img style="position: absolute; left: 4%;  top: 22%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/stackit-logo.svg" alt="STACKIT">
  <img style="position: absolute; left: 25%; top: 20%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/ovhcloud-seeklogo.svg" alt="OVHcloud">
  <img style="position: absolute; left: 47%; top: 23%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/scaleway.png" alt="Scaleway">
  <img style="position: absolute; left: 70%; top: 21%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/hetzner.png" alt="Hetzner">

  <img style="position: absolute; left: 3%;  top: 42%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/digitalocean.png" alt="DigitalOcean">
  <img style="position: absolute; left: 24%; top: 44%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/akamai-logo.svg" alt="Akamai">
  <img style="position: absolute; left: 46%; top: 41%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/exoscale-seeklogo.svg" alt="Exoscale">
  <img style="position: absolute; left: 68%; top: 43%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/brightbox-logo.svg" alt="Brightbox">
  <img style="position: absolute; left: 88%; top: 41%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/plusserver.png" alt="plusserver">

  <img style="position: absolute; left: 5%;  top: 64%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/openstack.png" alt="OpenStack">
  <img style="position: absolute; left: 27%; top: 66%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/vmware.jpeg" alt="VMware">
  <img style="position: absolute; left: 50%; top: 65%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/proxmox.png" alt="Proxmox">
  <img style="position: absolute; left: 72%; top: 66%; max-height: 90px; filter: drop-shadow(0 6px 14px rgba(0,0,0,.18))" src="assets/logos/external/clouds/qemu.jpeg" alt="QEMU">
</div>

---

<!-- _class: sidebar -->

# In production at

<div style="position: relative; width: 100%; height: 560px; margin-top: 8px">
  <img style="position: absolute; left: 2%;  top: 4%;  max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/companies/adobe.jpeg" alt="Adobe">
  <img style="position: absolute; left: 28%; top: 0%;  max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/companies/atnt.png" alt="AT&T">
  <img style="position: absolute; left: 52%; top: 5%;  max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/companies/deepl.png" alt="DeepL">
  <img style="position: absolute; left: 76%; top: 2%;  max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/companies/giantswarm.png" alt="Giant Swarm">

  <img style="position: absolute; left: 4%;  top: 32%; max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/companies/stackit.png" alt="STACKIT">
  <img style="position: absolute; left: 28%; top: 36%; max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/companies/qualys.png" alt="Qualys">
  <img style="position: absolute; left: 52%; top: 34%; max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/companies/wipro.png" alt="Wipro">
  <img style="position: absolute; left: 76%; top: 32%; max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/companies/equinix.png" alt="Equinix">

  <img style="position: absolute; left: 14%; top: 66%; max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/clouds/cloudbasesol-logo_hu_5371da61cf7b0047.webp" alt="Cloudbase Solutions">
  <img style="position: absolute; left: 44%; top: 68%; max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/clouds/vmaccel_testimonial_hedgehog.jpg" alt="Hedgehog">
  <img style="position: absolute; left: 66%; top: 66%; max-height: 130px; filter: drop-shadow(0 8px 18px rgba(0,0,0,.20))" src="assets/logos/external/clouds/cloudscale_hu_17df2ff04c9be12e.webp" alt="cloudscale.ch">
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

<!-- _class: sidebar -->

# Functionality, not Features

<div class="cols-2" style="align-items: start; gap: 40px; margin-top: 12px">

<div>

**General-purpose Linux**

- Choose your shell, desktop, stack
- Backports vs. new repos vs. waiting
- Think about *features*
- Build the system you want

</div>

<div>

**Flatcar**

- We choose for you — no pkg manager
- Whole OS updates automatically
- Think about *functionality* — does it work?
- We deliver a light switch

</div>

</div>

---

<!-- _class: sidebar -->

# Provisioned, not Installed

<div class="cols-2" style="align-items: start; gap: 40px; margin-top: 12px">

<div>

**Install**

- Interactive choices during setup
- Each machine ends up a little different
- The image and the config are one blob

</div>

<div>

**Provision**

- One declarative config, applied at boot
- Every machine is identical
- Same idea as containers

</div>

</div>

---

<!-- _class: lead -->

# You don't install Flatcar.

## You provision it.

---

# Flatcar UX

<div class="row row-center" style="gap: 24px; margin-top: 100px; flex-wrap: nowrap; align-items: center">

  <div style="flex: 1; padding: 32px 24px; border: 3px solid #12172B; border-radius: 14px; text-align: center; box-shadow: 6px 6px 0 #09BAC8; background: #FFFFFF">
    <div style="font-size: 30px; font-weight: 700">Butane YAML</div>
    <div style="font-size: 20px; margin-top: 8px; opacity: 0.7">Declarative config</div>
  </div>

  <div style="color: #09BAC8; font-size: 56px; font-weight: 700; flex-shrink: 0">→</div>

  <div style="flex: 1; padding: 32px 24px; border: 3px solid #12172B; border-radius: 14px; text-align: center; box-shadow: 6px 6px 0 #09BAC8; background: #FFFFFF">
    <div style="font-size: 26px; font-weight: 700">Cloud · VM · Bare Metal</div>
    <div style="font-size: 20px; margin-top: 8px; opacity: 0.7">Provisions</div>
  </div>

  <div style="color: #09BAC8; font-size: 56px; font-weight: 700; flex-shrink: 0">→</div>

  <div style="flex: 1; padding: 32px 24px; border: 3px solid #12172B; border-radius: 14px; text-align: center; box-shadow: 6px 6px 0 #09BAC8; background: #FFFFFF">
    <div style="font-size: 30px; font-weight: 700">Containers</div>
    <div style="font-size: 20px; margin-top: 8px; opacity: 0.7">Podman · K8s · systemd</div>
  </div>

</div>

---

# What Butane looks like

```yaml
# Butane config header — declares this is a Flatcar config
variant: flatcar
version: 1.0.0

# Drop in a systemd unit — Flatcar installs and starts it at first boot
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

```console
# Transpile Butane to an ignition config (JSON)
$ butane -o config.ign config.bu

# Boot Flatcar in QEMU with it applied
$ ./flatcar_production_qemu.sh -i config.ign
```

One YAML file in. One running machine out.

---

# …and after first boot

```console
$ systemctl is-active nginx.service
active

$ curl -sI http://localhost
HTTP/1.1 200 OK
Server: nginx/1.27.3
Content-Type: text/html
```

No SSH. No manual `docker run`. The machine came up already serving.

---

<!-- _class: sidebar -->

# Immutable by Design

- **First boot** provisions from config. After that: the base OS doesn't change.
- The OS is **read-only** and **dm-verity protected**.
- **No package updates** — the entire OS updates as one unit.
- Same config + same base image = **identical machine every time**.
- **sysexts** for optional add-ons.

---

<!-- _class: sidebar -->

# A/B Updates

<img style="display: block; margin: 0 auto 16px; max-width: 100%; max-height: 280px; object-fit: contain" src="assets/diagrams/ab-updates.svg" alt="Partition A running, partition B staged, swapped on reboot">

- Verified image staged to the **inactive partition**
- **Reboot** activates the new OS
- **Rollback** = reboot back to the old partition
- **No intermediate states** — it works, or it rolls back

---

<!-- _class: sidebar -->

# Channels

<img style="display: block; margin: 0 auto 16px; max-width: 100%; max-height: 240px; object-fit: contain" src="assets/logos/external/other/flatcar-release-channels.png" alt="Alpha to Beta to Stable release flow">

- **Alpha** — fully tested, may have incomplete features. Developers.
- **Beta** — production-ready. Canary alongside stable.
- **Stable** — widespread production. Promoted from beta.
- **LTS** — slower-moving track for environments that need it.

---

<!-- _class: lead -->

# Demos!

## github.com/John15321/SesjaLinuksowa

---

<!-- _class: sidebar -->

# Come find us

<div class="cols-2" style="align-items: start; gap: 32px">

<div>

**Online**

- **flatcar.org**
- **github.com/flatcar**
- **Discord**

</div>

<div>

**Meetings**

- **Office hours** — 2nd Tuesday, 2:30pm UTC
- **Dev Sync** — 4th Tuesday, 2:30pm UTC

</div>

</div>

Jump in — first-time contributors welcome.

---

<!-- _class: closing -->
<!-- _paginate: false -->

# Thank you!

<p class="closing-links">
  <a href="https://flatcar.org"><img src="assets/logos/flatcar-logotype/icon/white/flatcar-icon-white.svg" alt=""> flatcar.org</a>
  <a href="https://github.com/flatcar"><img src="assets/logos/external/github-white.png" alt=""> github.com/flatcar</a>
  <a href="https://discord.gg/PMYjFUsJyq"><img src="assets/logos/external/discord-white.svg" alt=""> discord.gg/PMYjFUsJyq</a>
</p>

*Questions?*
