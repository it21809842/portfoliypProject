select *
from CovidDeath

--select location,date,total_cases,total_deaths,(total_cases/population)*100 as DeathPercentage 
--from CovidDeath
--where location like '%state%'
--order by 1,2

--select location,population,MAX(total_cases) as HighestInfectionCount ,MAX(total_cases/population)*100 as precentPopulationInflact 
--from CovidDeath
----where location like '%state%'
--Group By location,population
--order by precentPopulationInflact  desc

--select location,MAX(cast (total_deaths as int)) as  total_deathsCount
--from CovidDeath
----where location like '%state%'
--Group By location
--order by total_deathsCount  desc

--select continent,MAX(cast (total_deaths as int)) as  total_deathsCount
--from CovidDeath
----where location like '%state%'
--where continent is Not  NULL
--Group By continent
--order by total_deathsCount  desc

--select  *
--from portfoliypProject.dbo.CovidDeath dea
--join portfoliypProject.dbo.CovidVaccinationdata vac
--on dea.location = vac.location
--and dea.date = vac.date
--where dea.continent is not NULL
--order by 2,3

--select dea.continent , dea.location,dea.date,dea.population,vac.new_vaccinations,SUM(CONVERT(int,vac.new_vaccinations)) OVER (partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccancies 
--from portfoliypProject.dbo.CovidDeath dea
--join portfoliypProject.dbo.CovidVaccinationdata vac
--on dea.location = vac.location
--and dea.date = vac.date
--where dea.continent is not NULL
--order by 2,3

--CREATE VIEW percentPopulatonVacancies as 
--select dea.continent , dea.location,dea.date,dea.population,vac.new_vaccinations
--,SUM(CONVERT(int,vac.new_vaccinations)) OVER (partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccancies 
--from portfoliypProject.dbo.CovidDeath dea
--join portfoliypProject.dbo.CovidVaccinationdata vac
--on dea.location = vac.location
--and dea.date = vac.date
--where dea.continent is not NULL
----order by 2,3

CREATE VIEW percentPopulatonVacancies as 
select dea.continent , dea.location,dea.date,dea.population,vac.new_vaccinations
,SUM(CONVERT(int,vac.new_vaccinations)) OVER (partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccancies 
from portfoliypProject.dbo.CovidDeath dea
join portfoliypProject.dbo.CovidVaccinationdata vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not NULL
--order by 2,3

select *
from percentPopulatonVacancies