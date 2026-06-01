# Trivy Scan Output Example

```text
Target: myservice:1.0.0
Type:   os,library

Total: 0 (CRITICAL), 1 (HIGH), 3 (MEDIUM)

CRITICAL: 0
HIGH: 1
- CVE-2026-0001 Package: openssl FixedVersion: 3.0.9-r1

Disposition: FAIL (high threshold exceeded)
```
