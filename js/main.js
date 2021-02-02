"use strict";

const notyf = new Notyf();
const ws_github = new axios.create({
  baseURL: "https://api.github.com/",
  timeout: 1000 * 10,
});

const handle_github_user = async (profile_name) =>
  ws_github.get(`/users/${profile_name}`);

const handle_github_repositories = async (profile_name) =>
  ws_github.get(`/users/${profile_name}/repos`);

const sort_repos_updated_desc = (repos = []) =>
  repos.sort((a, b) => Date.parse(b.updated_at) - Date.parse(a.updated_at));

const v = new Vue({
  el: "main",
  data: {
    github_profile: {},
    links: [],
  },
  methods: {
    handle_github_profile: async function (profile_name) {
      try {
        const [{ data: user }, { data: repos }] = await Promise.all([
          handle_github_user(profile_name),
          handle_github_repositories(profile_name),
        ]);

        const profile_repos = sort_repos_updated_desc(repos).filter(
          (r) => r.owner.id == user.id && r.fork == false
        );

        this.github_profile = {
          ...user,
          repositories: profile_repos,
        };

        return this.github_profile;
      } catch (error) {
        notyf.error("Falhou ao buscar as informações do perfil no github!");
        console.error(error.message, error);
      }
    },
  },
});
