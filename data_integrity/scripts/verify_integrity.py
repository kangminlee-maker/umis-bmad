#!/usr/bin/env python3
import os, sys, hashlib, json

CRITICAL_FILES = [
    ".project_metadata.yaml",
    "README.md",
]

def file_exists(path):
    return os.path.exists(path)

def checksum(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        for chunk in iter(lambda: f.read(8192), b''):
            h.update(chunk)
    return h.hexdigest()

def main():
    report = {"file_existence": {}, "checksums": {}}
    for p in CRITICAL_FILES:
        report["file_existence"][p] = file_exists(p)
        if report["file_existence"][p]:
            report["checksums"][p] = checksum(p)
    print(json.dumps(report, ensure_ascii=False, indent=2))

if __name__ == "__main__":
    sys.exit(main())

