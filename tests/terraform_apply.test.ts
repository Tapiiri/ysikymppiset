import { MockGithub } from "@kie/mock-github";
import { Act } from "@kie/act-js";
import path from "path";

let mockGithub: MockGithub;
beforeEach(async () => {
  // Set up the mock GitHub environment
  mockGithub = new MockGithub({
    repo: {
      testCompositeAction: {
        files: [
          {
            src: path.resolve(__dirname, "action-test.yml"), // Test workflow file
            dest: ".github/workflows/test.yml",
          },
          {
            src: path.resolve(__dirname, "../.github/actions/terraform-apply/action.yml"), // Your action file
            dest: "/action.yml",
          },
          {
            src: path.resolve(__dirname, "../dns_records.json"), // DNS records file
            dest: "/dns_records.json",
          },
          {
            src: path.resolve(__dirname, "../terraform/main.tf"), // Root Terraform file
            dest: "/main.tf",
          },
          {
            src: path.resolve(__dirname, "../terraform/variables.tf"), // Root variables file
            dest: "/variables.tf",
          },
          {
            src: path.resolve(__dirname, "../terraform/hetzner_dns/main.tf"), // Terraform module main file
            dest: "/hetzner_dns/main.tf",
          },
          {
            src: path.resolve(__dirname, "../terraform/hetzner_dns/variables.tf"), // Terraform module variables file
            dest: "/hetzner_dns/variables.tf",
          },          
          {
            src: path.resolve(__dirname, "mock-terraform.sh"), // Mock Terraform script
            dest: "./mock-terraform.sh",
          },
        ],
      },
    },
  });

  await mockGithub.setup();
});

afterEach(async () => {
  await mockGithub.teardown();
});

test("test Terraform Deploy Action", async () => {
  const act = new Act(mockGithub.repo.getPath("testCompositeAction"));

  const result = await act.runEvent("push");

  // Assertions to check if the workflow ran successfully
  expect(result.length).toBeGreaterThan(0);
  expect(result).toMatchObject([
    { name: "Main actions/checkout@v2", status: 0, output: "" },
    { name: "Main Run Terraform Apply Action", status: 0, output: "" },
    {
      name: "Main Checkout repository",
      status: 0,
      output: expect.any(String),
    },
    {
      name: "Main Set up Terraform",
      status: 0,
      output: expect.any(String),
    },
    {
      name: "Main Debug - Check Terraform Command",
      output: expect.stringContaining("Using Terraform command ./mock-terraform.sh"),
      status: 0,
    },
    {
      name: "Main Terraform Init",
      output: expect.stringContaining("Mock Terraform command: init"),
      status: 0,
    },
    {
      name: "Main Terraform Apply",
      output: expect.stringContaining("Mock Terraform command: apply"),
      status: 0,
    },
    {
      name: "Main Output DNS Record IDs",
      output: expect.any(String),
      status: 0,
    },
    {
      name: "Main Debug - Check DNS Record IDs",
      output: expect.stringContaining("DNS Record IDs Mock Terraform command: output"),
      status: 0,
    },
    {
      name: "Post Run Terraform Apply Action",
      status: 0,
      output: "",
    },
  ]);
});