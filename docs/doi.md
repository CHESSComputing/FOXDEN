# DOI Publication in FOXDEN

FOXDEN provides a **DOIService** for managing and looking up DOI (Digital Object Identifier) records associated with datasets. This service enables researchers to **publish, track, and reference datasets** using persistent identifiers.

## Overview

FOXDEN supports DOI management through both its **web UI** and **CLI**. Users can:

- **Create DOI records** for datasets via the FOXDEN web interface. By default it is created in **Draft** mode and can later be **converted to public**.
- **Use multiple DOI providers**: FOXDEN integrates with three DOI providers:
  - [DataCite](https://datacite.org/)
  - [Zenodo](https://zenodo.org/)
  - [Material Commons](https://materialcommons.org/)
- **Query and manage DOI records** via the `foxden` CLI.

---

## Using the Web UI

To create a DOI record for a dataset:

1. Navigate to the FOXDEN web UI and search for your desired dataset
2. Click **"Create DOI"** button – this will leads you to web form which will create **Draft** or **Public** DOI record
3. Eventually, you may convert the Draft record into a **Public DOI** too
4. The dataset will then be accessible via its permanent DOI link.

---

## Using the CLI

FOXDEN also provides a command-line interface (`foxden`) for managing DOI records. You can create and look up DOI records directly from the terminal.

### Checking Available DOI Options

Run the following command to see available DOI options:

```sh
foxden doi --help
```

### Creating and publishing DOI Record

To create a new DOI for a dataset:

```sh
foxden doi publish <did> --provider <provider>
```

For example, to create a DOI using **DataCite**:

```sh
foxden doi publish /beamline=3A/btr=2023 --provider datacite
```

This will generate a **Draft DOI** that can later be published.

### Looking Up a DOI Record

To retrieve metadata for a DOI:

```sh
foxden doi ls <did>
```

For example:

```sh
foxden doi ls 10.1234/example
```

---

## DOI Providers

FOXDEN integrates with multiple DOI providers. Below are the supported providers and their official references:

- **[DataCite](https://datacite.org/)** – A widely used DOI provider for research data.
- **[Zenodo](https://zenodo.org/)** – A repository for open-access research and dataset publication.
- **[Material Commons](https://materialcommons.org/)** – A DOI provider for material science research.

Each provider offers unique features, and you should choose based on your dataset's publication requirements.

---

## Summary

- FOXDEN’s **DOIService** allows **dataset DOI creation and lookup** via both the **web UI** and **CLI**.
- Users can create **Draft DOI records** and later publish them as **Public DOIs**.
- **Three providers are supported**: DataCite, Zenodo, and Material Commons.
- The `foxden` CLI provides a streamlined way to **create, publish, and look up DOIs**.

For more CLI options, run:

```sh
foxden doi --help
```

This ensures your datasets remain **permanently accessible and citable** through globally recognized DOI services.
